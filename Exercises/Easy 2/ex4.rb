# Retirement calculator

=begin
Problem: Calculate the retirement date out of user input and current year
input: int, int
out: print to screen, int
Examples / Test Cases:
puts calculate_retirement_year(0, 65) == YEAR + 65
puts calculate_retirement_year(0, 0) == false
puts calculate_retirement_year(0, -2) == false
Data Structure:
input: int, int
output: print, int
Algorithm:
GET age from user
GET retirement date from user
GET current year from time
if Compare Retirement - AGE > 0
  return year + Retirment - Age 
else
  return false
print result to screen
=end

YEAR = Time.now.year

def calculate_retirement_year(age, retirement)
  retirement - age + YEAR
end

def calulate_time_to_retirement(age, retirement)
  retirement - age
end


def start_program
  print 'What is your age? '
  age = gets.chomp.to_i
  print 'At what age would you like to retire? '
  retirement_age = gets.chomp.to_i

  retirement_year = calculate_retirement_year(age, retirement_age)
  retirement = calulate_time_to_retirement(age, retirement_age)

  puts "It's #{YEAR}. You will retire in #{retirement_year}."
  puts "You have only #{retirement} years of work to go!"
end

start_program

