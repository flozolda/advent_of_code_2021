require "awesome_print"

fishies = []

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    fishies = line.strip.split(",").map(&:to_i)
  end
end

for index in (0...80)
  add_fish = 0
  fishies.each_with_index do |fish, index|
    if fish.zero?
      add_fish += 1
      fishies[index] = 6
    else
      fishies[index] -= 1
    end
  end
  if add_fish > 0
    for i in (1..add_fish)
      fishies << 8
    end
  end
end

ap "Part one"
ap fishies.length

fishies = {}

for index in (0...9)
  fishies[index] = 0
end

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    line.strip.split(",").map(&:to_i).each_with_index do |fish, index|
      fishies[fish] += 1
    end
  end
end

for index in (0...256)
  next_fish_iter = {}
  fishies.each do |key, fish|
    next_fish_iter[key] ||= 0
    if key.zero?
      next if fish.zero?

      next_fish_iter[6] = next_fish_iter[6].to_i + fish
      next_fish_iter[8] = next_fish_iter[8].to_i + fish
      next_fish_iter[0] = 0
    else
      next_fish_iter[key - 1] = next_fish_iter[key - 1].to_i + fish
    end
    fishies = next_fish_iter
  end
end

ap "Part Two"
counter = 0
fishies.each do |k,v|
  counter += v
end

ap counter