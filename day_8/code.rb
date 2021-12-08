require "awesome_print"

output_values = []

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    temp = line.strip.split("|")[1]
    output_values << temp
  end
end


counter = 0
output_values.each do |val|
  val.split(" ").each do |lets|
    if [2,3,4,7].include? lets.length
      counter += 1
    end
  end
end

ap "Part one"
ap counter

input_values = []
output_values = []

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    temp1 = line.strip.split("|")[0]
    temp2 = line.strip.split("|")[1]
    input_values << temp1
    output_values << temp2
  end
end

counter = 0

input_values.each_with_index do |words,index|
  solver = []
  undone = true
  while undone
    words.split.each do |w|
      if w.length == 2
        solver[1] ||= w
      elsif w.length == 3
        solver[7] ||= w
      elsif w.length == 4
        solver[4] ||= w
      elsif w.length == 7
        solver[8] ||= w
      elsif w.length == 6
        next if solver[4].nil? || solver[7].nil?
        solver[9] ||= w if (w.chars - (solver[4].chars + solver[7].chars).uniq).length == 1
        next if solver[9].nil?

        if (w.chars - solver[9].chars).length == 1
          solver[6] ||= w
        else
          solver[9] ||= w
        end
        next if solver[6].nil?

        solver[0] ||= w if w != solver[9] && w != solver[6]
      elsif w.length == 5
        next if solver[6].nil?
        solver[5] = w if (w.chars & (solver[4].chars-solver[1].chars)).length  == 2
        solver[3] = w if (w.chars & solver[1].chars).length == 2

        if !solver[3].nil? && !solver[5].nil?
          solver[2] = w if w != solver[5] && w != solver[3]
        end
        #solver[2] ||= w if ((solver[6].chars - (solver[8].chars-solver[9].chars)).uniq & w.chars).length == 5
        
      end
    end

    undone = false if !solver.include?(nil)
    temp_solver = solver.clone
    temp_solver.each_with_index do |s,i|
      next if s.nil?
      temp_solver[i] = s.chars.sort.join
    end
    temp_worder = ""
    output_values[index].split.each do |wor|
      undone = true if temp_solver.index(wor.chars.sort.join).nil?
      temp_worder += temp_solver.index(wor.chars.sort.join).to_s
    end
    if temp_worder.length == 4
      counter += temp_worder.to_i
      undone = false
    end
  end
end


ap "Part Two"
ap counter