class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    
    unless game_over
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    puts add_random_color
  end

  def require_sequence
    input = gets.chomp
    self.game_over = true if input.split != seq
  end

  def add_random_color
    seq << COLORS[rand(4)]
  end

  def round_success_message
    puts "Success! On to the next round..."
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

game = Simon.new
game.play