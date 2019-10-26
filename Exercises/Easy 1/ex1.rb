# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

=begin
Output:

Hello
Hello
Hello
=end

=begin
  Problem: create a method that loops a give amount of time and that prints a string
    input: string, integer
    output: print to console 
  Test case: see example
  Data structure: string, integer
    no conversion neccessary
  Algorithm: 
  loop over number.times
    put out string every time  
=end

def repeat(string, n)
  n.times { puts string }
end


repeat('Hello', 3)