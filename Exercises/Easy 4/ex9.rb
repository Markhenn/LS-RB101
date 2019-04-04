# Convert a Number to a String!

=begin
Problem:
Create a method that takes an int and turns it into a string.
Dont use one of the inbuilt methods
input: int
output: string
test cases:
see below
data structure: 
input: int
output: string
Algorithm:
while number > 0
string = insert(0, number % 10)
number = number / 10
end
=end

DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(number)
  string = ''
  loop do
    number, remainder = number.divmod(10)
    string.prepend(DIGITS[remainder])
    return string if number == 0
  end
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
