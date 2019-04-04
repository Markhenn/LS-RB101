# Running Totals

=begin
Problem:
Write a method that takes an Array of numbers,
and returns an Array with the same number of elements,
and each element has the running total from the original Array.
input: array of numbers
output array of numbers
with the running total of the original array for each element
test cases:
see below
data structure:
input: array
output: array
Algorithm:
running_total = 0
array.map
  running_total += n
end
=end

def running_total1(array)
  r_total = 0
  array.map { |n| r_total += n }
end

def running_total2(array)
  sum = 0
  array.each_with_object([]) { |i, a| a << sum += i }
end

def running_total(array)
  totals = []
  array.reduce(0) do |sum, n|
     totals << (sum + n)
     sum + n
  end
  totals
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
