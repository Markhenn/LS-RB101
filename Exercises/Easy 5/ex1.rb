# ASCII String Value

=begin
Problem:
Write a method that returns the sum of the ASCII values of a string
ascii of empty string is 0
input: string
output: int
split string
get ascii for each letter
sum ascii

test cases:
see below

data structure:
input: string
output int

Algorithm:
split string into char array
reduce char array to sum of char.ord
=end

def ascii_value(string)
  string.each_char.reduce(0) { |sum, char| sum + char.ord }
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

# extra question: chr is the method. char.ord.chr == char
# ord just takes the first char in the string, the rest is ignored
