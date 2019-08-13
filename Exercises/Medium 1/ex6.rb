# Stack Machine Interpretation

# Problem:
# Built a program that functions like a stack programming language
# input: a string
# output: Display prints based on print command

# How to do that:
#   implement each method of the language as a method
#   have a major major that loops over the commands and executes

# Test Cases / Algorithm
# See below

# Data Structure / Algorithm
# Main Method
#   SET stack, register
#   Split string into parts
#   loop over the parts with each
#     call the langguage function with string, stach and register
#       set register equal to return of call

# Language interpreter
#   case for string
#     when int -> return int
#     when push call push method on register and value
#      continue until PRINT -> Call print on register return register

# write each method that is needed

TOKEN = ['PRINT', 'POP', 'PUSH', 'MULT', 'ADD', 'SUB', 'DIV', 'MOD']

def minilang(input)
  stack = []
  register = 0
  input.split.each do |command|
    if register == nil
      return 'Stack was empty'
    end

    unless TOKEN.include?(command) || integer?(command)
      return 'An invalid token in program'
    end

    register = command_interpreter(command, stack, register)
  end
  nil
end

def integer?(token)
  token == '0' || token.to_i.to_s != '0'
end

def command_interpreter(command, stack, register)
  case command
  when 'PRINT'  then print(register)
  when 'POP'    then register = pop(stack)
  when 'PUSH'   then push(stack, register)
  when 'MULT'   then register = mult(stack, register)
  when 'ADD'    then register = add(stack, register)
  when 'SUB'    then register = sub(stack, register)
  when 'DIV'    then register = div(stack, register) 
  when 'MOD'    then register = mod(stack, register)
  else               register = command.to_i
  end
  register
end

def print(register)
  puts register
end

def push(stack, register)
  stack << register
end

def mult(stack, register)
  register * stack.pop
end

def add(stack, register)
  register + stack.pop
end

def sub(stack, register)
  register - stack.pop
end

def div(stack, register)
  register / stack.pop
end

def mod(stack, register)
  register % stack.pop
end

def pop(stack)
  stack.pop
end

p minilang('PRINT')
# 0

p minilang('5 PUSH 3 MULT PRINT')
# 15

p minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

p minilang('5 PUSH POP PRINT')
# 5

p minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

p minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

p minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

p minilang('-3 PUSH 5 SUB PRINT')
# 8

p minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# Further Exploration
# (3 + (4 * 5) - 7) / (5 % 3)
# Write a minilang programm for that
# start in the back


p minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 SUB PUSH 4 PUSH 5 MULT ADD DIV PRINT')

# FE II
# Detect empty stack conditions 
# invalid token -> first part check
# return error or nil when no error