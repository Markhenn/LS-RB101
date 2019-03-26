# Greeting a user

=begin
Problem: Write a programm that looks for a specific pattern in user input to change its behaviour
input: string
output: console log string
Examples Test Cases: 
puts greeting('Bob') == 'Hello Bob.'
puts greeting('Bob!') == 'HELLO BOB. WHY ARE WE SCREAMING?'
Data Structure:
input: string 
maybe use regexp
output string
Algorithm:
GET name from user
check if name ends in !
display result to user
=end

def greeting(name)
  if name[-1] == '!'
    name.chop!
    return "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    return "Hello #{name}."
  end
end

def start_program
  print 'What is your name? '
  name = gets.chomp
  puts greeting(name)
end

start_program