require "awesome_print"

arr_num_arr = []

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    arr_num_arr << line.strip.chars.map(&:to_i)
  end
end
