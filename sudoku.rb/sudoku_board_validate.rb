def done_or_not(board)
  check_rows(board) && check_regions(board) && check_cols(board) ? "Finished!" : "Try again!"
end

def check_regions(board)
  slices = board.each_slice(3).to_a
  regions = slices.map { |slice| slice.transpose.reduce(:+).each_slice(9).to_a }.reduce(:+)
  regions.map { |region| check_sum(region) }.reduce(:&)
end

def check_rows(board)
  board.map { |region| check_sum(region) }.reduce(:&)
end

def check_cols(board)
  board.transpose.map { |region| check_sum(region) }.reduce(:&)
end

def check_sum(region)
  region.reduce(:+) == 45
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

puts '---------------------------'

puts done_or_not(
  [
    [5, 3, 4, 6, 7, 8, 9, 1, 2], 
    [6, 7, 2, 1, 8, 0, 3, 4, 9],
    [1, 0, 7, 3, 4, 2, 5, 6, 8],
    [8, 5, 9, 7, 6, 1, 4, 2, 3],
    [4, 2, 6, 8, 5, 3, 7, 9, 1],
    [7, 1, 3, 9, 2, 4, 8, 5, 6],
    [9, 6, 1, 5, 3, 7, 2, 1, 4],
    [2, 8, 7, 4, 1, 9, 6, 3, 5],
    [3, 2, 4, 5, 8, 6, 1, 7, 9]
 ]
)   
