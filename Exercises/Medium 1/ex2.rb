# Rotation Part 2

# Problem
# The method rotates the last n digits
# input: number (int), int
# output: number
# The int n will always be positive
# When n == 1 return the same number
# I assume not mutating the caller -> no bang

# Examples / Test Cases
# See below

# Algorithm / Data Structure
# turn number into string
# split string
# slice the 0..-n element and
#    add to it a call to rotate_array with the rest
# then join and turn into int

def rotate_array(ary)
  ary[1..-1] + [ary[0]]
end

def rotate_rightmost_digits1(number, n)
  num_ary = number.to_s.chars
  rot_ary = num_ary[0...-n] + rotate_array(num_ary[-n..-1])
  rot_ary.join.to_i
end

def rotate_rightmost_digits(number, n)
  num_ary = number.to_s.chars
  num_ary[-n..-1] = rotate_array(num_ary[-n..-1])
  num_ary.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
