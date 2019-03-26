# Exclusive OR

=begin
Problem: write a xor method. Exclusive or
input: two booleans
output: true if only one of the inputs is true, but not both true or both false
test cases:
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false
data structure:
input: boolean
output: boolean
Algorithm:
if a is true and b is false or a is false and be is true
  return true
else
  return false
=end

def xor?(a, b)
  (a && !b) || (b && !a)
end


puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false