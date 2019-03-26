# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

=begin
Problem: Find out if a number is part of another set of numbers
input: integers
output: print to screen, boolean
Examples Test Cases
puts find_number([1, 2, 3, 4, 5,], 3) == true
puts find_number([1, 2, 3, 4, 5,], 6) == false
Data Structure:
input: integers
Turn first 5 into an array
output: boolean -> display
Algorithm
SET Array []
GET first number from user -> push to array
GET second number from user -> push to array
GET third number from user -> push to array
GET fourth number from user -> push to array
GET fifth number from user -> push to array
GET last number from user
Check if last number is in array
display result
=end

def find_number?(numbers, num_to_find)
  numbers.include?(num_to_find)
end

def start_program
  numbers = []
  
  puts '==> Enter the 1st number:'
  numbers << gets.chomp.to_i
  puts '==> Enter the 2nd number:'
  numbers << gets.chomp.to_i
  puts '==> Enter the 3rd number:'
  numbers << gets.chomp.to_i
  puts '==> Enter the 4th number:'
  numbers << gets.chomp.to_i
  puts '==> Enter the 5th number:'
  numbers << gets.chomp.to_i
  puts '==> Enter the last number:'
  num_to_find = gets.chomp.to_i

  number_found = find_number?(numbers, num_to_find)

  if number_found
    puts "The number #{num_to_find} appears in #{numbers}."
  else
    puts "The number #{num_to_find} does not appear in #{numbers}."
  end
end

start_program
