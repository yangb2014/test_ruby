#!/usr/bin/ruby -w

=begin
Sudoku 是一种数学游戏把一个9行9列的棋盘分为9个3x3的方块
  在棋盘上填入1~9这九个数字，使得每行(row)每列(column)每块(box)的9个格子内数字不重复
回溯算法（Back Tracking Method）
精确覆盖算法（Exact Cover）
=end

require 'set'

@base = '123456789'.chars
# @param {Character[][]} board
# @return {Boolean}
def valid_sudoku(board)
  # amazing: !(0..80).flat_map{|k| (c=board[i=k/9][j=k%9])>'.' ? [[c,i],[j,c],[i/3,j/3,c]] : k}.uniq!
  seen = Set.new
  (0...9).each do |i|
    (0...9).each do |j|
      num = board[i][j]
      next unless @base.include?(num)
      return false if !seen.add?(num + " in row #{i}") || !seen.add?(num + " in col #{j}") || !seen.add?(num + " in box #{i / 3}-#{j / 3}")
    end
  end
  # puts seen.inspect
  true
end

# @param {Character[][]} board
# @return {Character[][]}
def format_sudoku(board)
  (0...9).each do |i|
    (0...9).each do |j|
      board[i][j] = '.' if !@base.include?(board[i][j]) and board[i][j] != '.'
    end
  end
  puts 'format succeed.'
end

# @param {Character[][]} board
# @return {Character[][]}
def print_sudoku(board)
  board.map { |a1| a1.map { |a2| a2.is_a?(Array) ? a2.join : a2 }.join('|') }
end

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  solve_recursive(board)
  puts 'solve succeed.'
end

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_recursive(board)
  (0...9).each do |row|
    (0...9).each do |col|
      next unless board[row][col] == '.'
      unsigned = @base - get_avaiable(board, row, col)
      # puts "unsigned: (#{row},#{col}) #{unsigned.join}"
      unsigned.each do |char|
        next unless is_valid?(board, row, col, char)
        board[row][col] = char
        return true if solve_recursive(board)
        board[row][col] = '.'
      end
      return false
    end
  end
  true
end

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_other(board)
  puts 'start solve...'
  (0...81).each { |idx| board[idx / 9][idx % 9] = @base if board[idx / 9][idx % 9] == '.' }
  count = 20
  while count > 0
    count -= 1
    is_succeed = true
    (0...9).each do |row|
      (0...9).each do |col|
        next if board[row][col].size == 1

        avaiable = get_row_avaiable(board, row) + get_column_avaiable(board, col) + get_box_avaiable(board, row, col)
        unsigned = @base - avaiable
        board[row][col] = unsigned
        puts "#{row}-#{col}: " + board[row][col].inspect
        is_succeed = false
      end
    end
    print_sudoku(board)
    break if is_succeed
  end
end

def is_valid?(board, row, col, ch)
  (0...9).each do |i|
    return false if board[row][i] == ch
    return false if board[i][col] == ch
    return false if board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] != '.' && board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] == ch
  end
end

def get_avaiable(board, row, col)
  line = (0...9).each_with_object([]) do |i, result|
    result << board[row][i] if board[row][i] != '.' and board[row][i].size == 1
    result << board[i][col] if board[i][col] != '.' and board[i][col].size == 1
  end
  min_row, min_col = (row / 3) * 3, (col / 3) * 3
  box = (min_row...(min_row + 3)).each_with_object([]) do |i, result|
          (min_col...(min_col + 3)).each do |j|
            result << board[i][j] if board[i][j] != '.' and board[i][j].size == 1
          end
        end
  # puts "avaiable: (#{row},#{col}) #{line.join}, #{box.join}"
  (line + box).uniq
end

board = \
   [['1', '.', '.', '.', '5', '.', '.', '6', '.'] \
  , ['.', '.', '3', '.', '.', '.', '5', '.', '.'] \
  , ['.', '4', '.', '9', '6', '.', '7', '1', '.'] \
  , ['.', '.', '.', '.', '.', '.', '1', '.', '.'] \
  , ['3', '8', '.', '5', '.', '7', '.', '4', '9'] \
  , ['.', '.', '6', '.', '.', '.', '.', '.', '.'] \
  , ['.', '5', '1', '.', '2', '9', '.', '3', '.'] \
  , ['.', '.', '9', '.', '.', '.', '4', '.', '.'] \
  , ['.', '2', '.', '.', '7', '.', '.', '.', '6']]

is_valid = valid_sudoku(board)
puts "sudoku is #{is_valid}"
exit unless is_valid

format_sudoku(board)
puts print_sudoku(board)
solve_sudoku(board)
puts print_sudoku(board)
