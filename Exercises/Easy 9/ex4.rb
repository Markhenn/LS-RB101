# Counting Up

# Problem
# input: int
# output: array of ints
# return an array that includes all the number until the input

# Algorithm / Data structure
# SET array
# call upto on 1 with limit int
#   push number to array
# return array

def sequence3(number)
  array = []
  1.upto(number) { |num| array << num }
  array
end

def sequence2(number)
  (1..number).map { |num| num }
end

def sequence1(number)
  (1..number).to_a
end

# should count up towards -1
def sequence(number)
  if number.negative?
    (number..-1).to_a
  else
    (1..number).to_a
  end
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
puts sequence(-3) == [-3, -2, -1]
