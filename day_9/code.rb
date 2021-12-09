require "awesome_print"

height_map = []

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    height_map << line.strip.split("")
  end
end

risk_sum = 0

for i in (0...height_map.length)
  for j in (0...height_map[i].length)
    up = i.zero? ? nil : height_map[i-1][j].to_i
    down = i + 1 >= height_map.length ? nil : height_map[i+1][j].to_i
    left = j.zero? ? nil : height_map[i][j-1].to_i
    right = j + 1 >= height_map[i].length ? nil : height_map[i][j+1].to_i

    lowest = true
    [up, down, left, right].each do |dir|
      next if dir.nil?
      if height_map[i][j].to_i > dir
        lowest = false
        next
      end
    end

    next unless lowest
    
    risk_sum += height_map[i][j].to_i + 1
  end
end

ap risk_sum