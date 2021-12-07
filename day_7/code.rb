require "awesome_print"

crabs_positions = []
possible_positions = []

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    crabs_positions = line.strip.split(",").map(&:to_i)
  end
end

crabs_positions.each do |crab_pos|
  possible_positions << crab_pos if !possible_positions.include? crab_pos
end

current_best = 9999999999999
mean = possible_positions.sum(0.0) / possible_positions.size

for index in (1...mean.abs+1)
  temp = 0
  crabs_positions.each do |crab_pos|
    temp += (index-crab_pos).abs
  end
  current_best = temp if temp < current_best
end

ap "Part one"
ap "Fuel spent #{current_best}"

current_best = 999999999999999
mean = possible_positions.sum(0.0) / possible_positions.size
ap mean

for i in (1...mean.abs+1)
  temp = 0
  crabs_positions.each do |crab_pos|
    for index in (1...(i-crab_pos).abs+1)
      temp += index
    end
  end
  current_best = temp if temp < current_best
end

ap "Part Two"
ap "Fuel spent #{current_best}"