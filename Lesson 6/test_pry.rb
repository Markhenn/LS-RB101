# Testing pry

require 'pry'
require 'pry-byebug'

puts 'Type 1'
input = gets.chomp

# binding.pry calls the debugger at this line to help me debug
binding.pry

if input == 1
  puts 'One'
else
  puts 'Not One'
end
