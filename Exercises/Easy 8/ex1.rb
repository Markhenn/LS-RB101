# Sum of Sums

# Problem
# input: array of numbers
# output: integer
# sum up the numbers in the array with the following numbers
#   including the already add numbers
#   see test cases for clarification

# How to solve it
# two loops
#   loop one sets the end of the inner loop
#   the inner loop adds all the numbers up to the end
#   then the end moved forward

# Data structure / algorithm
# SET result = 0
# SET index_end = 1
# loop
#   call each on number[0, index_end]
#     add number to result
#   index_end +1
#   break if end index is size of numbers
# return result

def sum_of_sums1(numbers)
  result = 0
  index_end = 1
  loop do
    numbers[0, index_end].each { |number| result += number }
    break if index_end >= numbers.size

    index_end += 1
  end
  result
end

def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end

p [3, 5, 2][0, 1]
puts sum_of_sums([3, 5, 2])
puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3])
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35
