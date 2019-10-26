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


# `line 29` defines a method called `find_fibonacci_index_by_length' with one parameter called `digits`
#  next we initialize the local variable `index` to an integer object with the value `1`
# next we initialize the local variable `last_fib_number` to an integer object with the value `0`
# next we initialize the local variable `fib_number` to an integer object with the value `1`
# the method `Kernel#loop` is called with a `do..end` block from `line 33` to `line 39`
# `line 34` calls the `break` keyword if the following return value evaluates to true. On the Object of `fib_number`the `Integer#>=` is called passing in the return value of calling the `Integer#**` on the Integer `10` passing in return value of calling the `Integer#-` method on the object of the local variable `digit` passing in the Integer object `1`
# next the local variable `fib_number` is reassinged to the return value of calling the `Integer#+` method on `fib_number` passing in the object of `last_fib_number` as an argument
#....
# `line 38` returns the object of the local variable `index`
# this method is an example of showing the rules for variable scoping and returning values from methods
# `line 44` calls the `Kernel#puts` method passing in the return value of calling the `Integer#==` method on the the return of `find_fibonacci_index_by_length` were the integer object `2` is passed in as argument. The literal integer object `7` is then passed in as argument to the `Integer#==` method.