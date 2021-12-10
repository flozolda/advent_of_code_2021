require "awesome_print"

height_map = []

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    height_map << line.strip.split("")
  end
end
