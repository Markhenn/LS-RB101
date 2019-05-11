# Multiply All Pairs

# Problem
# Input: 2 arrays of numbers
# Output: 1 array
# each number in each array in multiplied with each in the other
# not an empty array
# sort by value ascending

# How to do it?
# use the product method -> map with reduce -> then sort

def multiply_all_pairs(ary1, ary2)
  ary1.product(ary2).map { |ary| ary.reduce(:*) }.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
