# Transpose 3x3

# Problem
# a method that transposes a 3x3 matrix
# dont use stock options
# dont mutate

# input: nested array 3x3
# ouput: nested array 3x3

# Data Structure / Algorithm
# set up empty array with size n
# each index on matrix 2 times / row and columns
#   new ary at column / row is matrix at row column

# return new ary

def transpose(matrix)
  size = matrix.size
  transposed = Array.new(size) { Array.new(size) }

  matrix.each_with_index do |line, row|
    line.each_index do |col|
      transposed[col][row] = matrix[row][col]
    end
  end

  transposed
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# LS FE
# Problem
# mutate the matrix

# map! the matrix

def transpose!(matrix)
  size = matrix.size

  size.times do |row|
    size.times do |col|
      matrix[col] << matrix[row].shift
    end
  end
  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose!(matrix)

p new_matrix
p matrix
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
