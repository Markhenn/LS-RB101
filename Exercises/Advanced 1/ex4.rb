# Transpose MxN

# Problem
# Transpose any matrix with at least 1 row and column

def transpose(matrix)
  rows = matrix.size
  columns = matrix.first.size
  transposed = Array.new(columns) { Array.new(rows) }

  matrix.each_with_index do |line, row|
    line.each_index do |col|
      transposed[col][row] = matrix[row][col]
    end
  end

  transposed
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
