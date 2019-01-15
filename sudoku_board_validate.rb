def done_or_not(board)
  
  @column_random = []
  @matrix_validate_first = []
  @matrix_validate_middle = []
  @matrix_validate_last = []
  validate = true
  
  board.each_with_index do |row, index_row|
    validate_row(row)
    row.each_with_index do |column, index_column|
      validate_column(row, index_row, column, index_column)
    end
  end
  return validate_region(board)
  return 'Finished!'
end

def validate_column(row, index_row, column, index_column)
  if index_row <= 9
    if index_row == 9
      column unless column.eql? column.uniq
      @column_random.clear
    end
    @column_random << column[index_row][index_column]
  end
end

def validate_row(row)
  row unless row.eql? row.uniq
end

def validate_region(board)
  row_column_of_board(board)
end

def row_column_of_board(board)
  board.each_with_index do |row, index_row|
    row.each_with_index do |column, index_column|
      create_matrix_first(board, index_row, index_column)
      create_matrix_middle(board, index_row, index_column)
      create_matrix_last(board, index_row, index_column)

      
      if (@matrix_validate_first.size == 9 && (index_row == 8 && index_column == 2) || (index_row == 2 && index_column == 2) || (index_row == 5 && index_column == 2))
        return 'Try again!' unless check_matrix(@matrix_validate_first)
      end
      
      if (@matrix_validate_middle.size == 9 && (index_row == 2 && index_column == 5) || (index_row == 5 && index_column == 2) || (index_row == 8 && index_column == 5))
       return 'Try again!' unless check_matrix(@matrix_validate_middle)
      end
 
      if (@matrix_validate_last.size == 9  && (index_row == 8 && index_column == 8) || (index_row == 5 && index_column == 8) || (index_row == 2 && index_column == 8))
        return 'Try again!' unless check_matrix(@matrix_validate_last)
      end
    end
  end
end

def create_matrix_first(board, index_row, index_column)
  if index_row < 3 && index_column < 3
    @matrix_validate_first << board[index_row][index_column]
  elsif (index_row < 5 && index_row > 2) && index_column < 3
    if index_column == 3
      @matrix_validate_first.clear
    end
    @matrix_validate_first << board[index_row][index_column]
  elsif index_row > 5 && index_column < 3
    if index_row == 6
      @matrix_validate_first.clear
    end
    @matrix_validate_first << board[index_row][index_column]
  end
end

def create_matrix_middle(board, index_row, index_column)
  if index_row < 3 && (index_column > 2 && index_column < 6)
    @matrix_validate_middle << board[index_row][index_column]
  elsif (index_row > 2 && index_row < 6) && (index_column > 2 && index_column < 6 )
    if index_column == 3
      @matrix_validate_middle.clear
    end
    @matrix_validate_middle << board[index_row][index_column]
  elsif index_row > 5 && (index_column > 2 && index_column < 6)
    if index_column == 6
      @matrix_validate_middle.clear
    end
    @matrix_validate_middle << board[index_row][index_column]
  end
end

def create_matrix_last(board, index_row, index_column)

  puts "Last: #{@matrix_validate_last} = board[#{index_row}][#{index_column}]"
  if index_row <= 2 && (index_column > 5 && index_column < 8)
    @matrix_validate_last << board[index_row][index_column]
  elsif (index_row > 2 && index_row < 6) && (index_column > 5 && index_column < 8)
    if index_column == 3
      @matrix_validate_last.clear
    end
    @matrix_validate_last << board[index_row][index_column]
  elsif index_row > 5 && (index_column > 5 && index_column < 8)
    if index_column == 6
      @matrix_validate_last.clear
    end
    @matrix_validate_last << board[index_row][index_column]
  end
end

def check_matrix(matrix)
  puts "([1,2,3,4,5,6,7,8,9] - #{matrix}).empty? && (#{matrix}matrix.eql? #{matrix.uniq}) = #{([1,2,3,4,5,6,7,8,9] - matrix).empty? && (matrix.eql? matrix.uniq)}"
  ([1,2,3,4,5,6,7,8,9] - matrix).empty? && (matrix.eql? matrix.uniq)
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