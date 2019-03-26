# Odd lists 

=begin
Problem: A method that returns the 1, 3, 5 ... element of an array
input: an array with different elements
output: an array with only the 1, 3, 5 ... element of the original array
Test cases:
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
data structure:
input array
output array
Algorithm:
loop over the array
if index even
  push element to new array
=end

def oddities(array)
  array.select.with_index {|n, i| i.even?}
end

def eventies(array)
  even_elements = []
  index = 1
  while index < array.size
    even_elements << array[index]
    index += 2
  end
  even_elements
end

def eventies2(array)
  even_elements = []
  
  array.each_index do |i|
    even_elements << array[i] if i.odd?
  end

  even_elements
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

puts eventies([2, 3, 4, 5, 6]) == [3, 5]
puts eventies([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts eventies(['abc', 'def']) == ['def']
puts eventies([123, 456]) == [456]
puts eventies([]) == []

puts eventies2([2, 3, 4, 5, 6]) == [3, 5]
puts eventies2([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts eventies2(['abc', 'def']) == ['def']
puts eventies2([123, 456]) == [456]
puts eventies2([]) == []