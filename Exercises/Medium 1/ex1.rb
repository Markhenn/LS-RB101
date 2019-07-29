# Rotation Part 1

# Problem
# method moves first element to the end
# but shouldnt mutate the caller
# input: array
# output: array

# Questions?
# Empty array?

# Test cases / Examples
# see below

# Data Structure / Algorithm
#

def rotate_array1(ary)
  new_ary = ary.map { |n| n }
  new_ary.push(new_ary.shift)
end

def rotate_array2(ary)
  new_ary = []
  ary.each_index do |i|
    new_ary << if i + 1 == ary.size
                 ary[0]
               else
                 ary[i + 1]
               end
  end
  new_ary
end

def rotate_array(ary)
  ary[1..-1] + [ary[0]]
end

def rotate_string(string)
  strg_ary = string.chars
  rotate_array(strg_ary).join
end

def int_to_array(int)
  int_array = []
  loop do
    int, num = int.divmod(10)
    int_array.unshift(num)
    break if int == 0
  end
  int_array
end

def rotate_int1(int)
  int_ary = int_to_array(int)
  rotate_array(int_ary).join('').to_i
end

def rotate_int(int)
  int_ary = int.to_s.chars
  rotate_array(int_ary).join.to_i
end

p rotate_int(1) == 1
p rotate_int(12345) == 23451

p rotate_string('abcd') == 'bcda'
p rotate_string('a') == 'a'

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true
