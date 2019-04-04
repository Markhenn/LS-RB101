# Convert a Signed Number to a String!

=begin
Problem:
create a method that turns a signed integer into a string
Dont use any built in methods

check if int is positive or negative
make int positive
call integer_to_string with positive int
add the negative sign or positive sign
  but no sign for zero

test cases:
see below
data structure:
input: int
output: string
Algorithm:


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

def signed_integer_to_string(number)
  sign = '+'
  if number == 0
    return '0'
  elsif number < 0
    sign = '-'
    number *= -1
  end

  integer_to_string(number).prepend(sign)
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
