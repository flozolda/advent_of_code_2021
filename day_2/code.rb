require "awesome_print"

horizontal = 0
vertical = 0

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    # puts line
    # feedHash
    l = line.split(" ")
    
    case l[0]
    when "forward"
      horizontal += l[1].to_i
    when "down"
      vertical += l[1].to_i
    when "up"
      vertical -= l[1].to_i
    else
      ap "Something went wront"
    end
  end
end

ap vertical*horizontal

ap "Part 2"

horizontal = 0
vertical = 0
aim = 0

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    # puts line
    # feedHash
    l = line.split(" ")
    
    case l[0]
    when "forward"
      horizontal += l[1].to_i
      vertical += aim * l[1].to_i
    when "down"
      aim += l[1].to_i
    when "up"
      aim -= l[1].to_i
    else
      ap "Something went wront"
    end
  end
end

ap vertical*horizontal