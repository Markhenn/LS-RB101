# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

=begin
  Problem: print a random number between 20 and 200
    input: 
    output: Print to console
  Test case: 'Teddy is 69 years old!'
  Data structure: integer, string
  Algorithm:
  Generate random number
  string interpolate random number
=end

puts 'Whats your name? (No input defaults to Teddy)'
name = gets.chomp
name = 'Teddy' if name.empty?
puts "#{name} is #{rand(20..200)} years old!"
