# Fibonacci Numbers (Procedural)

# Problem
# Write the fib sequence as a procedural method
#   no recursion

# fib(n-1) + fib(n-2)
# count down from n
# while summing up from the buttom

# DS / Algo
# set fib1 to 0
# set fib2 to 1
# 1 upto n
#   fib1, fib2 = fib2, fib1 + fib2
# fib2

def fibonacci(n)
  fib1 = 0
  fib2 = 1
  1.upto(n - 1) { fib1, fib2 = fib2, fib1 + fib2 }
  fib2
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
