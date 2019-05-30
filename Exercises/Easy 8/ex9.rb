# Convert number to reversed array of digits

# Problem
# input: int
# output: int
# method reverses the input
# watch out for octal numbers :)

# Data structure / Algorithm
# turn into string -> reverse -> turn back to int

def reversed_number(number)
  number.to_s.reverse.to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1
