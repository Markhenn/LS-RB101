# This is the morgage calculator

=begin
 You'll need three pieces of information:

the loan amount
the Annual Percentage Rate (APR)
the loan duration

From the above, you'll need to calculate the following two things:

monthly interest rate
loan duration in months

m = p * (j / (1 - (1 + j)**(-n)))

m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months

Problem:
built a method that takes the 3 inputs and returns the monthly payment
input: numbers - loan amount, APR, loan duration
output: float - monthly payment
testcases: see below.
Data structures:
input: amount = float, apr = float, duration = int
output monthly_payment = float
Algorithm:
- validate the three inputs - duration in months cant be zero
calculate yearly payment
divide by 12 to get monthly payment
=end

def prompt(message)
  puts "=> #{message}"
end

def input_validation?(num)
  if num.to_i.to_s == num
    true
  else
    prompt('Duration, APR or amount need to be a whole number and can\'t be 0')
    false
  end
end

def receive_a_num
  loop do
    num = gets.chomp
    if input_validation?(num)
      return num.to_i
    else
      prompt('Duration, APR or amount need to be a whole number and can\'t be 0')
    end
  end
end

def morgage_calc(amount, apr, duration)
  interest_monthly = apr.to_f / 100 / 12
  duration_monthly = duration * 12

  amount * interest_monthly / (1 - (1 + interest_monthly)**(-duration_monthly))
end

def welcome
  prompt('Welcome to the morgage calculator!')

  loop do
    prompt('How much is the loan? Please use a whole number')
    loan = receive_a_num
    prompt('How much is the APR? Please use a whole number like 1 for 1% or 3 for 3%')
    apr = receive_a_num
    prompt('How long is the loan running? Please input the years as a whole number')
    duration = receive_a_num

    monthly_payment = morgage_calc(loan, apr, duration)
    prompt("Your expected monthly payment is $#{format('%02.2f', monthly_payment)}")

    prompt('Would you like to run the calculator again? Type y for yes')
    repeat = gets.chomp
    break unless repeat.downcase.start_with?('y')
  end

  prompt('Thank you for using the morgage calculator!')
end

welcome

=begin
puts morgage_calc(100_000, 5, 30)
puts morgage_calc(0, 1, 1) == false
puts morgage_calc(1, 0, 1) == false
puts morgage_calc(1, 1, 0) == false
puts morgage_calc(100_000, 5, 10)
puts morgage_calc(100_000, 5, 5)
puts morgage_calc(100_000, 5, 2)
puts morgage_calc(100_000, 5, 1)
=end
