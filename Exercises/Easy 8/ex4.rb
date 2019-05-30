# All Substrings

# Problem
# A method that returns all the substrings in a string
# use the method from ex3
# first come the substrings on index 0, then on index 1 etc
# they are ordered by length

# How to do it
# create a loop for the beginning string
# slice the input from the start
#   use the sliced string as input for the substrings_at_start method
#   append the return to the result
# count up the bigging of the string
# flatten the result before return

# Data structure / algorithm
# Set substrings array
# 0. upto string.size -1
#   substrings << substrings_at_start(string[count..-1])
# substrings.flatten

def substrings_at_start(string)
  result_array = []
  0.upto(string.size - 1) do |index|
    result_array << string.slice(0..index)
  end
  result_array
end

def substrings(string)
  substrings = []
  (0..string.size).each do |start_index|
    substrings.concat(substrings_at_start(string[start_index..-1]))
  end
  substrings
end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
