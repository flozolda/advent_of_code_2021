require "awesome_print"

input = []

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    input << line.strip.split("")
  end
end
