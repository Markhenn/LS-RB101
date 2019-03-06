# Consider the following method and a call to that method: Use the ruby documentation to determine what this code will print.

=begin
  Problem: Determine output to console of method call
  Test case: see below
  Data structure: array, number
  Algorithm: look up documentation
=end

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# This will print [4,5,3,6] because of the default positional arguments by Ruby