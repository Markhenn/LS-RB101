# Triangle Sides

# Problem
# Decide if a triangle is valid and what triangle it might be
# input: 3 numbers
# output: symbol (1 of 4)

# equilateral: All 3 sides are of equal length
# isosceles: 2 sides are of equal length, while the 3rd is different
# scalene: All 3 sides are of different length
# every side must be longer than 0
# the sum of the shorter sides must be longer then the longest side
# else invalid

# check if all are the same -> :equilateral
# check if the shorter sides sum is longer than the longest side
#   check if 2 are the same -> :isosceles
#   else -> :scalene
# else invalid

# add all ints to array sort pop -> name longest
# sum the array and check if bigger than longest

# Data Structure / Algorithm
# create array from all inputs
# case the array
# when all are the same and first > 0 -> :equilateral
# when sum is wrong -> invalid
# when both in remaining array are same -> :isosceles
# else :scalene

def sides_to_short?(ary)
  ary[0] + ary[1] < ary[2]
end

def triangle(num1, num2, num3)
  ary = [num1, num2, num3].sort

  case
  when ary.any?(&:zero?), sides_to_short?(ary)
    :invalid
  when ary.reduce(:+) / 3 == ary[0]
    :equilateral
  when ary[0] == ary[1], ary[1] == ary[2]
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
p triangle(0, 0, 0) == :invalid
