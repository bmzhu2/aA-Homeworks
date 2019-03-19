class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    cups.each_with_index do |cup, i|
      unless i == 6 || i == 13
        4.times {cup << :stone}
      end
    end
  end

  def valid_move?(start_pos)
    if !(0...6).to_a.include?(start_pos) && !(7..12).to_a.include?(start_pos)
      raise 'Invalid starting cup'
    elsif cups[start_pos].empty?
      raise 'Starting cup is empty'
    end
    true
  end

  def make_move(start_pos, current_player_name)
    stones_in_hand, cups[start_pos] = cups[start_pos], []

    current_pos = start_pos
    until stones_in_hand.empty?
      current_pos = (current_pos + 1) % 14
      if current_player_name == @name1 && current_pos != 13
        cups[current_pos] << stones_in_hand.pop
      elsif current_player_name == @name2 && current_pos != 6
        cups[current_pos] << stones_in_hand.pop
      end
    end

    render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    if (@name1 && ending_cup_idx == 6) || (@name2 && ending_cup_idx == 13)
      :prompt
    elsif cups[ending_cup_idx].count > 1
      ending_cup_idx 
    else
      :switch
    end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    p1_empty = true
    cups.take(6).each {|cup| p1_empty = false if !cup.empty?}
    p2_empty = true
    cups[7..12].each {|cup| p2_empty = false if !cup.empty?}

    p1_empty || p2_empty
  end

  def winner
    case cups[6] <=> cups[13]
    when 0
      :draw
    when 1
      @name1
    when -1
      @name2
    end
  end
end
