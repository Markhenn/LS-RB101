# Fibonacci Number Location By Length

# Problem:
# input: number (digits of the first fib number)
# output: number (index that corresponds to that number)
# write a method that returns the index of the fib fib number
#   that has the given number of digits

# first fib number is 1 and its index is 1
#   index 0 in an array would be 0?
# digits always >= 2

# How to do that?
# calculate fib sequence
#   if number >= 10**digits_needed
#     break and return the index

# Data structur / algorithm
#  set index = 1
#  set last_fib_number = 0
#  set fib_number = 1
#  loop
#   if fib_number is bigger equal to 10 to the power of digits needed
#     return the index
#   fib_number += last_fib_numbers
#   last_fib_number -= fib_number
#   index += 1

def find_fibonacci_index_by_length(digits)
  index = 1
  last_fib_number = 0
  fib_number = 1
  loop do
    break if fib_number >= 10 ** (digits - 1)
    
    fib_number += last_fib_number
    last_fib_number = fib_number - last_fib_number
    index += 1
  end

  index
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
