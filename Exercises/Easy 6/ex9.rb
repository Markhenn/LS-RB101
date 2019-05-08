# Does My List Include This?

# Problem:
# input: array and a value
# output: boolean
# method that takes an array and value
# finds out if the value is in the array

# Data structure / algorithm
# set result
# if use index
#   result = true
# else
#   result = false
# return result

def include?(ary, value)
  !!ary.index(value)
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false
