# Double Doubles

# Problem
# input: int
# output: int
# return the int if it is a double number
#   double number means the first half and the second half are exactly the same
# if not a double number, double the number

# Data structure / Algorithm
# turn number into string to test for double number
# when first half of string is equal to second half
#   return number
# else -> return number * 2

def twice(number)
  number_string = number.to_s
  index_at_half = number_string.size / 2
  if number_string[0, index_at_half] == number_string[index_at_half..-1]
    number
  else
    number * 2
  end
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
puts twice(5)
