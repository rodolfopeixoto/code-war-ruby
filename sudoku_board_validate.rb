require 'pry'

SIZE = 9
NUMBERS = (1..9).to_a

def done_or_not(board)
  @board = board
  @board.each_with_index do |row, x|
    row.each_with_index do |column, y|
      return 'Try again!' if allowed(x,y).size > 1
    end
  end
  return 'Finished!'
end

def row(y)
  Array.new(@board[y])
end

def column(x)
  @board.map { |row| row[x] }
end

def allowed_in_row(y)
  (NUMBERS - row(y)).uniq << nil
end

def allowed_in_column(x)
  (NUMBERS - column(x)).uniq << nil
end

def allowed_in_square(x,y)
  square_x = 3 * (x/3)
  square_y = 3 * (y/3)
  square = []

  3.times do |row|
    3.times do |column|
      square << @board[square_y + column][square_x + row]
    end
  end

  (NUMBERS - square).uniq << nil
end

def allowed(x,y)
  allowed_in_row(y) & allowed_in_column(x) & allowed_in_square(x, y)
end

puts done_or_not(
    [
        [5, 3, 4, 6, 7, 8, 9, 1, 2], 
        [6, 7, 2, 1, 9, 5, 3, 4, 8],
        [1, 9, 8, 3, 4, 2, 5, 6, 7],
        [8, 5, 9, 7, 6, 1, 4, 2, 3],
        [4, 2, 6, 8, 5, 3, 7, 9, 1],
        [7, 1, 3, 9, 2, 4, 8, 5, 6],
        [9, 6, 1, 5, 3, 7, 2, 8, 4],
        [2, 8, 7, 4, 1, 9, 6, 3, 5],
        [3, 4, 5, 2, 8, 6, 1, 7, 9]
    ]
)

puts '---------------------------'

puts done_or_not(
  [
    [5, 3, 4, 6, 7, 8, 9, 1, 2], 
    [6, 7, 2, 1, 9, 0, 3, 4, 9],
    [1, 0, 0, 3, 4, 2, 5, 6, 0],
    [8, 5, 9, 7, 6, 1, 0, 2, 0],
    [4, 2, 6, 8, 5, 3, 7, 9, 1],
    [7, 1, 3, 9, 2, 4, 8, 5, 6],
    [9, 0, 1, 5, 3, 7, 2, 1, 4],
    [2, 8, 7, 4, 1, 9, 6, 3, 5],
    [3, 0, 0, 4, 8, 1, 1, 7, 9]
 ]
)    


# Test.assert_equals(done_or_not([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
#     [6, 7, 2, 1, 9, 5, 3, 4, 8],
#     [1, 9, 8, 3, 4, 2, 5, 6, 7],
#     [8, 5, 9, 7, 6, 1, 4, 2, 3],
#     [4, 2, 6, 8, 5, 3, 7, 9, 1],
#     [7, 1, 3, 9, 2, 4, 8, 5, 6],
#     [9, 6, 1, 5, 3, 7, 2, 8, 4],
#     [2, 8, 7, 4, 1, 9, 6, 3, 5],
#     [3, 4, 5, 2, 8, 6, 1, 7, 9]]), 'Finished!')
           
# Test.assert_equals(done_or_not([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
#     [6, 7, 2, 1, 9, 0, 3, 4, 9],
#     [1, 0, 0, 3, 4, 2, 5, 6, 0],
#     [8, 5, 9, 7, 6, 1, 0, 2, 0],
#     [4, 2, 6, 8, 5, 3, 7, 9, 1],
#     [7, 1, 3, 9, 2, 4, 8, 5, 6],
#     [9, 0, 1, 5, 3, 7, 2, 1, 4],
#     [2, 8, 7, 4, 1, 9, 6, 3, 5],
#     [3, 0, 0, 4, 8, 1, 1, 7, 9]]), 'Try again!')