require "awesome_print"

pipe_map = []

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    pipes = line.strip.split(" -> ")

    pipe1 = pipes[0].split(",").map(&:to_i)
    pipe2 = pipes[1].split(",").map(&:to_i)

    x1 = pipe1[0]
    y1 = pipe1[1]
    x2 = pipe2[0]
    y2 = pipe2[1]

    pipe_map[x1] ||= []
    pipe_map[x2] ||= []

    if (x1 - x2).zero?
      # pipe is vertical
      if y1 < y2
        y1.step(to: y2).each do |s|
          pipe_map[x1][s] ||= 0
          pipe_map[x1][s] += 1
        end
      else
        y2.step(to: y1).each do |s|
          pipe_map[x1][s] ||= 0
          pipe_map[x1][s] += 1
        end
      end
    elsif (y1 - y2).zero?
      # pipe is horizontal 
      if x1 < x2
        x1.step(to: x2).each do |s|
          pipe_map[s] ||= []
          pipe_map[s][y1] ||= 0
          pipe_map[s][y1] += 1
        end
      else
        x2.step(to: x1).each do |s|
          pipe_map[s] ||= []
          pipe_map[s][y1] ||= 0
          pipe_map[s][y1] += 1
        end
      end
    elsif ((x1 + x2).abs == (y1 + y2).abs) || ((x1 + y1).abs == (x2 + y2).abs) || ((x1 + y2).abs == (x2 + y1).abs)
      #diagonal
      if x1 == y1 && x2 == y2
        x1.step(to: x2).each do |s|
          pipe_map[s] ||= []
          pipe_map[s][s] ||= 0
          pipe_map[s][s] += 1
        end
      else
        if x1 < x2 &&  y1 > y2
          steps = x2 - x1
          0.step(to: steps).each do |s|
            pipe_map[x1+s] ||= []
            pipe_map[x1+s][y1-s] ||= 0
            pipe_map[x1+s][y1-s] += 1
          end
        elsif x2 < x1 &&  y2 > y1
          steps = x1 - x2
          0.step(to: steps).each do |s|
            pipe_map[x2+s] ||= []
            pipe_map[x2+s][y2-s] ||= 0
            pipe_map[x2+s][y2-s] += 1
          end

        elsif x1 < x2 && y1 < y2
          steps = x2 - x1
          0.step(to: steps).each do |s|
            pipe_map[x1+s] ||= []
            pipe_map[x1+s][y1+s] ||= 0
            pipe_map[x1+s][y1+s] += 1
          end
        elsif x2 < x1 && y2 < y1
          steps = x1 - x2
          0.step(to: steps).each do |s|
            pipe_map[x2+s] ||= []
            pipe_map[x2+s][y2+s] ||= 0
            pipe_map[x2+s][y2+s] += 1
          end
        end
      end
    end
  end
end

counter = 0

pipe_map.each do |column|
  next if column.nil?
  column.each do |num|
    next if num.nil?
    counter += 1 if num > 1
  end
end
ap counter