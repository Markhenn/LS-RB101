# Fibonacci Numbers (Recursion)

# Problem
# Write a method that uses recursion to determine the nth fibonacci number
# input: int (fibonacci index)
# output: int (fibonacci number)
# fib formular: F(n) = F(n - 1) + F(n - 2) where n > 2
# F(1) = 1
# F(2) = 1

# How to use recursion
# stop condition
#   n == 1 or n == 2 -> return 1 either way
# running condition
# F(n-1) + F(n-2)

# Test Cases / Examples
# see below

# Data structure / Algorithm
# return 1 when n is 1 or 2
# fib(n-1) + fib(n-2)

def fibonacci(n)
  return 1 if n == 1 || n == 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1)
p fibonacci(2)
p fibonacci(3)
p fibonacci(4)
p fibonacci(5)
p fibonacci(6)
p fibonacci(7)
p fibonacci(8)
p fibonacci(9)
p fibonacci(10)
p fibonacci(11)
p fibonacci(12)
p fibonacci(13)
p fibonacci(14)
p fibonacci(15)
p fibonacci(16)
p fibonacci(17)
p fibonacci(18)
p fibonacci(19)
p fibonacci(20)

# Tail Recursion solution:
# This computes a lot faster, because the system can optimize the solution
def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci1(nth)
  fibonacci_tail(nth, 1, 1)
end
