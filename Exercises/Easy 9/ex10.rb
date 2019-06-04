# Grocery List

# Problem
# Input: a nested array with a fruit and a number
# Output: an array
# create an array that contains the correct amounts of fruit to buy
# turn [apples, 3] into [apple, apple, apple]

# Data structure / Algorithm
# call map on array
#   return array with [element[0]] times element[1]
# flatten array

def buy_fruit(ary)
  ary.map { |fruit, quantity| [fruit] * quantity }.flatten
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
