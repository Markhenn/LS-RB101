# Rotation Part 3

# Problem
# the method returns the maximum rotation of an int
# input: int
# output: int
# Maximum rotation:
#   the number is rotated step by step
#   first just the left number
#   then hold new left number and rotate the rest
#   then hold the first 2 and rotate the rest
#   finish after the last 2 digits have been rotated

# Test cases / Examples:
# see below

# Data structure / Algorithm
# split number into a char array
# pos = array.size
# loop
# call rotate right on number with pos
# pos - 1
# loop breaks when it has rotated the last two digits
#     pos == 1
# end
# return array.join.to_i

def rotate_array(ary)
  ary[1..-1] + [ary[0]]
end

def rotate_rightmost_digits(number, n)
  num_ary = number.to_s.chars
  num_ary[-n..-1] = rotate_array(num_ary[-n..-1])
  num_ary.join.to_i
end

def max_rotation1(number)
  pos = number.to_s.size

  loop do
    number = rotate_rightmost_digits(number, pos)
    pos -= 1
    break if pos <= 1
  end
  number
end

def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# The three part approach makes the methods more readable and easier to understand.
# to preserve the zeros it might be useful to turn the number into an array right away and then keep it there until the end

def rotate_rightmost_digits_in_array(ary, n)
  ary[-n..-1] = rotate_array(ary[-n..-1])
end

def max_rotation_preserve_zero(number)
  number_array = number.to_s.chars
  number_digits = number_array.size
  number_digits.downto(2) do |n|
    rotate_rightmost_digits_in_array(number_array, n)
  end
  number_array.join
end

p max_rotation_preserve_zero(735291) == '321579'
p max_rotation_preserve_zero(3) == '3'
p max_rotation_preserve_zero(35) == '53'
p max_rotation_preserve_zero(105) # the leading zero gets dropped
p max_rotation_preserve_zero(8_703_529_146) == '7321609845'

