# Leading Substrings

# Problem
# A method that returns all the substrings leading from the beginning
# input: string
# output: array of strings
# How to do that:
# slice the string 
#   on every iteration make the slice 1 step bigger
#   until you reach the end of the string
#   then return the whole string

# Data structure / algorithm
# SET array
# 1 upto string.size num
#   array push string.slice(0, num)
# return array

def substrings_at_start(string)
  result_array = []
  1.upto(string.size) do |count|
    result_array << string.slice(0, count)
  end
  result_array
end

puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
