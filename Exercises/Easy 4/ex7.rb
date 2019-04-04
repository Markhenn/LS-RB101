# Convert a String to a Number!

=begin
Problem:
Create a method that analyses each char of a numeric string
than returns the string as an int.
input: string
output: int
test cases:
see below
data structure:
input: string
divide into chars
turn in ints
output: int
Algorithm:
split string into chars in an array
turn each char into int
reverse array
multiply each int by its position (i * 10**position)
sum all ints with reduce
=end

DIGITS = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0
}

HEX = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
}

def string_to_integer(string)
  char_array = string.chars.reverse
  char_array.reduce(0) { |sum, n| sum + DIGITS[n] * 10**char_array.index(n) }
end

def hexadecimal_to_integer(string)
  array = string.chars.reverse.map { |char| HEX[char.upcase] }
  array.reduce(0) { |sum, n| sum + n * 16**array.index(n) }
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

puts hexadecimal_to_integer('4D9f') == 19871
