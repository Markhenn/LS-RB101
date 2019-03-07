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


def stringy (number, option = 1)
  string = ''
  number.times {|n| string << ((n + option).odd? ? '1' : '0')}
  return string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'



=begin
alternative
def stringy number
  string = ''
  number.times {|n| string << ((n + 1) % 2).to_s}
  return string
end
=end
