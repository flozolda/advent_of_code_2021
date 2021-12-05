require "awesome_print"

numbers_to_draw_arr = []
bingo_nums = []
first = true
bingo_nums_arr = []
bingo_nums = []
File.open("input.txt", "r") do |f|
  f.each_line do |line|
    if first
      numbers_to_draw_arr = line.strip.split(",").map(&:to_i)
      first = false
      next
    end
    if line == "\n"
      bingo_nums_arr << bingo_nums if bingo_nums.length.positive?
      bingo_nums = []
    else
      row_arr = []
      line.strip.split.map(&:to_i).each do |number|
        num = {
          "number" => number,
          "called" => false
        }
        row_arr << num
      end
      bingo_nums << row_arr
    end
    bingo_nums_arr << bingo_nums if f.eof?
  end
end

# ap numbers_to_draw_arr
# ap bingo_nums_arr

def check_bingo(board,i,j)
  bingo_hor = true
  bingo_ver = true
  for index in (0...board[i].length)
    bingo_hor = false if board[i][index]["called"] == false
  end
  for index in (0...board.length)
    bingo_ver = false if board[index][j]["called"] == false
  end

  if bingo_ver == true || bingo_hor == true
    return true
  else
    return false
  end
end

def sum_unmarked(board)
  sum = 0

  board.each do |row|
    row.each do |num|
      sum += num["number"] if num["called"] == false
    end
  end
  return sum
end

last_drawn = nil
sum_unmarked_num = nil
bingo = false

numbers_to_draw_arr.each do |drawn_num|
  bingo_nums_arr.each do |board|
    board.each_with_index do |row,i|
      row.each_with_index do |num,j|
        if num["number"] == drawn_num
          num["called"] = true
          if check_bingo(board, i, j)
            last_drawn = drawn_num
            sum_unmarked_num = sum_unmarked(board)
            ap "Bingo!"
            bingo = true
            break
          end
        end
        break if bingo == true
      end
      break if bingo == true
    end
    break if bingo == true
  end
  break if bingo == true
end

ap last_drawn
ap sum_unmarked_num
ap "Result: #{last_drawn*sum_unmarked_num}"

ap "Part Two"

numbers_to_draw_arr = []
bingo_nums = []
first = true
bingo_nums_arr = []
bingo_nums = []
File.open("input.txt", "r") do |f|
  f.each_line do |line|
    if first
      numbers_to_draw_arr = line.strip.split(",").map(&:to_i)
      first = false
      next
    end
    if line == "\n"
      bingo_nums_arr << bingo_nums if bingo_nums.length.positive?
      bingo_nums = []
    else
      row_arr = []
      line.strip.split.map(&:to_i).each do |number|
        num = {
          "number" => number,
          "called" => false
        }
        row_arr << num
      end
      bingo_nums << row_arr
    end
    bingo_nums_arr << bingo_nums if f.eof?
  end
end


last_drawn = nil
sum_unmarked_num = nil
last_bingo = false
boards_to_skip = []

numbers_to_draw_arr.each do |drawn_num|
  bingo_nums_arr.each_with_index do |board, board_num|
    next if boards_to_skip.include? board_num
    board.each_with_index do |row,i|
      row.each_with_index do |num,j|
        if num["number"] == drawn_num
          num["called"] = true
          if check_bingo(board, i, j)
            ap "Bingo!"
            if bingo_nums_arr.length() -1 == boards_to_skip.length()
              ap board
              last_drawn = drawn_num
              sum_unmarked_num = sum_unmarked(board)
              last_bingo = true
              break
            else
              boards_to_skip << board_num
            end
          end
        end
        break if last_bingo
      end
      break if last_bingo
    end
    break if last_bingo
  end
  break if last_bingo
end
ap last_drawn
ap sum_unmarked_num
ap "Result: #{last_drawn*sum_unmarked_num}"