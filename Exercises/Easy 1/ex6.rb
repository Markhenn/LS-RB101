# Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

=begin
  Problem: Only reverse words that are => 5 in size
  input: string of words
  output: string of words with some reversed
  Test case: see below
  Data structure: 
  input: string
  change to array
  output: string
  Algorithm: 
  split string into array
  loop over array
    reverse words that are => 5
  join array to string
=end

def reverse_words string
  reverse_size5 = Proc.new {|element| element.size >= 5 ? element.reverse : element }
  string.split.map(&reverse_size5).join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

  