# Write a method that takes one argument, a string,
# and returns a new string with the words in reverse order.

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

def reverse_sentence(string)
  string.split.reverse.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

# `Line 21` defines a method called reverse_sentence with a parameter called `string`
# then `line 22` calls the String#split method on the object of the local variable `string`
# on the return value the #Array#reverse method is called, on this return value the Array#join method passing in a String object with the value of `" "` as an argument is called

# `line 26` invoces the Kernel#puts method passing in the return value of calling the `reverse_sentence` method passing in a string object with the value of `Hello World`. The return value is compared to the string literal `World Hello`

# This is an example for how to reverse words in a sentence
# the return value is a string with the words sequence reversed
