require "awesome_print"

arr_num_arr = []

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    arr_num_arr << line.strip.chars.map(&:to_i)
  end
end

gamma_rate = ""

for index in (0...arr_num_arr[0].length)
  zero = 0
  one = 0

  arr_num_arr.each do |num_arr|
    case num_arr[index]
    when 0
      zero += 1
    when 1
      one += 1
    else
      ap "Something went wront"
    end
  end

  if one > zero
    gamma_rate += "1"
  else
    gamma_rate += "0"
  end
end


epsilon_rate = ""

gamma_rate.chars.map.each do |l|
  case l
  when "0"
    epsilon_rate += "1"
  when "1"
    epsilon_rate += "0"
  else
    ap "Something went wront"
  end
end

ap epsilon_rate.to_i(2)
ap gamma_rate.to_i(2)

ap "Power Consumption is #{epsilon_rate.to_i(2)*gamma_rate.to_i(2)}"

ap "Part Two"

arr_num_arr = []

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    arr_num_arr << line.strip.chars.map(&:to_i)
  end
end

work_array_oxy = arr_num_arr.dup
work_array_co2 = arr_num_arr.dup

for index in (0...work_array_oxy[0].length)
  zero = 0
  one = 0
  keep = nil

  work_array_oxy.each do |num_arr|
    case num_arr[index]
    when 0
      zero += 1
    when 1
      one += 1
    else
      ap "Something went wront"
    end
  end

  if one >= zero
    keep = 1
  else
    keep = 0
  end

  temp_arr = []

  work_array_oxy.each do |element|
    if element[index] == keep
      temp_arr << element
    end
  end

  work_array_oxy = temp_arr
end

ap "oxi"
ap (work_array_oxy[0]*"").to_i(2)

for index in (0...work_array_co2[0].length)
  

  zero = 0
  one = 0
  keep = nil

  work_array_co2.each do |num_arr|
    case num_arr[index]
    when 0
      zero += 1
    when 1
      one += 1
    else
      ap "Something went wront"
    end
  end

  if zero <= one
    keep = 0
  else
    keep = 1
  end

  temp_arr = []

  work_array_co2.each do |element|
    if element[index] == keep
      temp_arr << element
    end
  end

  work_array_co2 = temp_arr
  break if work_array_co2.length == 1
end

ap "co2"
ap (work_array_co2[0]*"").to_i(2)

ap "Life Support rating"
ap (work_array_co2[0]*"").to_i(2)*(work_array_oxy[0]*"").to_i(2)