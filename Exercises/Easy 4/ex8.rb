# Convert a String to a Signed Number!

=begin
Problem:
improve the last method of string to integer to include + and -
if the string has a + -> make it positive
if the string has a - -> make it negative
if nothing sign -> make it positive
test cases:
see below
data structure:
input: string
output: int
Algorithm:
get first char of string
if number
  return call old method with string
elsif +
  return call old method with string from 1-end
else
  return call old method with string from 1-end * -1
end
=end

DIGITS = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0
}

def string_to_integer(string)
  char_array = string.chars.reverse
  char_array.reduce(0) { |sum, n| sum + DIGITS[n] * 10**char_array.index(n) }
end

def string_to_signed_integer1(string)
  case string[0]
  when '+' then string_to_integer(string[1..-1])
  when '-' then string_to_integer(string[1..-1]) * -1
  else string_to_integer(string)
  end
end

def string_to_signed_integer(string)
  signed_string = string
  
  if ['+', '-'].include?(string[0])
    string = string[1..-1]
  end

  integer = string_to_integer(string)

  if signed_string[0] == '-'
    -integer
  else
    integer
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
