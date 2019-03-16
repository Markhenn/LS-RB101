# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

# The tests above should print true.

=begin
  Problem: How to reverse the word position in the string not the words itself
  input: string with words
  output: string with words in reverse order 
  Test case: see below
  Data structure: 
  input: string
  change to array
  output: string
  Algorithm: 
  split string into array of words
  reverse elements in array
  join array to string
=end

def reverse_sentence string
  ary = string.split.reverse.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'