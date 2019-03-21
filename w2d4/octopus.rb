def sluggish_octopus(fish)

    sorted = true
    while sorted == true
        sorted = true
        (0...fish.length-1).each do |i|
            if fish[i].length > fish[i+1].length
                fish[i], fish[i+1] = fish[i+1], fish[i]
                sorted = false
            end
        end
    end

    fish[-1]
end

def dominant_octopus(fish)
    return fish[0] if fish.length == 1

    left_fish = dominant_octopus(fish[0...fish.length/2])
    right_fish = dominant_octopus(fish[fish.length/2..-1])

    if left_fish.length > right_fish.length
        left_fish
    else
        right_fish
    end
end

def clever_octopus(fish)
    biggest_pos = 0
    biggest = 0

    fish.each_with_index do |fish, i|
        if fish.length > biggest
            biggest_pos = i
            biggest = fish.length
        end
    end

    fish[biggest_pos]
end

school_of_fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p sluggish_octopus(school_of_fish)
p dominant_octopus(school_of_fish)
p clever_octopus(school_of_fish)

def slow_dancing_octopus(tile, tiles_array)
    tiles_array.each_with_index do |ele, i|
        return i if tile == ele
    end
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

p slow_dancing_octopus("up", tiles_array)
p slow_dancing_octopus("right-down", tiles_array)

def constant_dancing_octopus(tile, tile_hash)
    tile_hash[tile]
end

tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7}

p constant_dancing_octopus("up", tiles_hash)
p constant_dancing_octopus("right-down", tiles_hash)