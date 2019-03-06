# Assume you have the following code: What will each of the 4 puts statements print?

=begin
  Problem: Define difference in output based on arguments
  Test case: see below
  Data structure: Date class
  Algorithm: test out in irb
=end

require 'date'

puts Date.new
puts Date.new(2016)
puts Date.new(2016, 5)
puts Date.new(2016, 5, 13)

# gives the year 4712 BC jan first this year is the default and used to convert between calendars
# first of jan 2016 ->
# first of may 2016
# 13 may 2016