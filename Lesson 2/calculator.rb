# Calculator Assignment

=begin
Build a command line calculator program that does the following:

asks for two numbers
asks for the type of operation to perform: add, subtract, multiply or divide
displays the result

Problem: s.o. description
input: number, number, string (for operation)
output: console print result
Examples:
calc(1,1,add) => 2
calc(1,1,subtract) => 0
calc(1,1,multiply) => 1
calc(1,1,divide) => 1
calc(1,0,add) => 1
calc(1,0,subtract) => 1
calc(1,0,multiply) => 0
calc(1,0,divide) => error exception
Data Structures
input: number, string,
output: print to console
Algorithm:
print intro to screen
get number 1
get number 2
get operation
case operation
  add
  substract
  multiply
  divide
    check if second number is zero
      yes -> print that this is not possible to calculate
print result to console
=end

def welcome
  puts "Welcome to the calculator!"
  puts "Please put in a number: "
  number_1 = Kernel.gets().chomp().to_i()
  puts "Please put in another number: "
  number_2 = Kernel.gets().chomp().to_i()
  puts 'Please choose an operator: add, subtract, multiply, divide'
  operator = Kernel.gets().chomp()
  calc(number_1, number_2, operator)
end

def calc(x, y, operator)
  case operator
  when 'add' then puts x + y
  when 'subtract' then puts x - y
  when 'multiply' then puts x * y
  when 'divide' then y == 0 ? (puts "Division by 0 not possible") : (puts x.to_f / y)
  end
end

welcome()

=begin
calc(1,1,'add')
calc(1,1,'subtract')
calc(1,1,'multiply')
calc(1,1,'divide')
calc(1,0,'add')
calc(1,0,'subtract')
calc(1,0,'multiply')
calc(1,0,'divide') 


calc(1,1,add) => 2
calc(1,1,subtract) => 0
calc(1,1,multiply) => 1
calc(1,1,divide) => 1
calc(1,0,add) => 1
calc(1,0,subtract) => 1
calc(1,0,multiply) => 0
calc(1,0,divide) => error exception
=end