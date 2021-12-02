require "awesome_print"

counter = 0
prev = nil
File.open("input.txt", "r") do |f|
  f.each_line do |line|
    # puts line
    # feedHash
    current = line[0..-2].to_i

    if prev.nil?
      prev = current
      next
    end

    if prev < current
      counter += 1
    end

    prev = current
  end
end

ap counter

ap "Second Part"

counter = 0
prev = nil
numbers = []
File.open("input.txt", "r") do |f|
  f.each_line do |line|
    # puts line
    # feedHash
    numbers << line[0..-2].to_i
  end
end


summed_nums = []

for index in (0...numbers.length)
  break if index + 3 > numbers.length
  value = index
  value2 = index +1
  value3 = index +2
  summed_nums << numbers[value] + numbers[value2] + numbers[value3]
end

summed_nums.each do |current|
  if prev.nil?
    prev = current
    next
  end

  if prev < current
    counter += 1
  end

  prev = current
end

ap counter