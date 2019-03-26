# Sum or Product of Consecutive Integers

=begin
Problem: A program that either sums up or products all numbers up to a number by the user
input: integer, string
output: integer
Examples: 
puts sum(1) == 1
puts sum(5) == 15
puts product(1) == 1
puts product(6) == 720
Data Structre:
input: integer, string
output: integer
Algorithm:
GET int from user
GET p or s from user
if p
  product = 1
  while counter not number
    product *= number
if s
  sum = 0
  while counter not number
    sum += number
display result (sum or number)
=end

OPERATIONS = {
  's' => {long: 'sum'},
  'p' => {long: 'product'}
}

def sum(number)
  (0..number).reduce {|sum, n| sum + n}
end

def product(number)
  (1..number).reduce {|prod, n| prod * n}
end

def start_program
  number = ''
  loop do
    puts '>> Please enter an integer greater than 0:'
    number = gets.chomp.to_i
    break if number > 0
  end
  
  computation = ''
  loop do
    puts ">> Enter 's' to compute the sum, 'p' to compute the product."
    computation = gets.chomp.downcase
    break if OPERATIONS.include?(computation)
  end

  if computation == 's'
    result = sum(number)   
  else
    result = product(number)
  end

  puts "The #{OPERATIONS[computation][:long]} of the integers between 1 and #{number} is #{result}."
end

start_program