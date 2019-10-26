# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer. The tests should print true.

=begin
  Problem: creating a string of alternating 1 and 0. length of string comes from a given int
  input: integer
  output: string with 1010...
  Test case: see below
  Data structure: 
  input: int
  output: string
  Algorithm: 
  create a loop that runs int times
    take modulo 2 of looping number and add that to string
  return string
=end

def stringy(number, option = 1)
  string = ''
  number.times { |n| string << (n + option).odd? ? '1' : '0' }
  string
end

p stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# `line 17` defines a method called `stringy` with two parameters called `number` and `option` option has a default Integer value of `1`.
# `line 18` initializes a local variable named string and assigns a String object of `''`
# then we call the Integer#times method on the local variable `number` passing in a single line block as arguement.
# The single line block has one parameter called `n`.
# In the block the String#<< is called on the local variable of string passing in the return value of the terniary operator. 
# The terniary operator evalutes the return value of calling the Integer#odd? method on the return value of calling the Integer#+ method on the local variable of n passing in the local variable of option as an argument.
# The terniary operator can return either the String object `1` or the String object `0`
# `line 20` returns the object of the variable `string`. Being the last line in the method this object will be the return value of the method.

# `line 23` calls the Kernel#puts method passing in the return value of calling the method `stringy` passing in the Integer object `6` as an argument. 
# The return value of 


=begin
alternative
def stringy number
  string = ''
  number.times {|n| string << ((n + 1) % 2).to_s}
  return string
end
=end
