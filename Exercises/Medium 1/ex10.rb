# Fibonacci Numbers (Last Digit)

# Problem
# Compute the last digit of the fib number
# calculate fib number
# turn into string and retrieve the last digit
# turn into int

def fibonacci_last1(n)
  fib = fibonacci(n)
  fib.to_s[-1].to_i
end

def fibonacci(n)
  fib1 = 0
  fib2 = 1
  1.upto(n - 1) { fib1, fib2 = fib2, fib1 + fib2 }
  fib2
end

def fibonacci_last2(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

def fibonacci_last(nth)
  nth %= 60
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
p fibonacci_last(123_456_789_987_745)
# FE
# If number is can be devided by 15 las digit is 0
