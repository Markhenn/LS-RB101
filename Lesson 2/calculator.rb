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

def prompt(message)
  puts "=> #{message}"
end

def validate_num?(num)
  num.to_i != 0
end

def input_op
  operator_prompt = <<-MSG
  Please choose an operator:
  1. add
  2. subtract
  3. multiply
  4. divide
  MSG
  prompt(operator_prompt)
  operator = ''
  loop do
    operator = gets.chomp
    if %w(add subtract multiply divide 1 2 3 4).include?(operator)
      break
    else
      prompt("Please use, add, subtract, multiply, divide or 1, 2, 3, 4!")
    end
  end
  operator
end

def receive_a_num
  num = ''
  loop do
    prompt("Please put in a number: ")
    num = gets.chomp.to_i
    if validate_num?(num)
      break
    else
      puts "Doesnt look like a number"
    end
  end
  num
end

def operation_to_msg(operator)
  case operator
  when 'add' then 'adding'
  when 'subtract' then 'subtracting'
  when 'multiply' then 'multiplying'
  when 'divide' then 'dividing'
  end
end

def welcome
  prompt("Welcome to the calculator!")
  loop do
    number1 = receive_a_num
    number2 = receive_a_num
    operator = input_op

    prompt("#{operation_to_msg(operator)} the two numbers...")
    calc(number1, number2, operator)
    prompt('Do you want to go again? Type y for another round')
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end

def calc(x_num, y_num, operator)
  result =  case operator
            when 'add', '1' then x_num + y_num
            when 'subtract', '2' then x_num - y_num
            when 'multiply', '3' then x_num * y_num
            when 'divide', '4'
              if y_num == 0
                "Division by 0 not possible"
              else
                x_num.to_f / y_num
              end
            end

  prompt(result)
end

prompt('Please enter your name: ')
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt('Please make sure to enter your name')
  else
    break
  end
end

prompt("Hi, #{name}")

welcome()

prompt('Thank you for using the Calculator')

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
