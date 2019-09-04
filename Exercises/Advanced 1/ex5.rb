# Rotating Matrices

# Problem
# rotate a matrix 90 degree clockwise

# input: matrix nxm as nested array
# output: matrix as mxn as nested array

# What is a 90 degree clockwise rotation in array terms?
# first column becomes first row
# last column becomes last row
# middle column becomes middle row

# its a transpose and then reversing all the rows

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

def rotate90(matrix)
  transpose(matrix).map(&:reverse)
end

def rotate(matrix, degree)
  return puts 'Degree must divisible by 90!' unless degree.modulo(90).zero?
  rotations = degree / 90
  rotated = matrix

  rotations.times { rotated = rotate90(rotated) }
  rotated
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

p rotate(matrix2, 90) == new_matrix2
p rotate(matrix2, 180) == rotate90(rotate90(matrix2))
p rotate(matrix2, 270) == rotate90(rotate90(rotate90(matrix2)))
p rotate(matrix2, 360) == new_matrix3
