# fizzbuzz

# Problem:
# input: starting number and endding number (int)
# output: a print of numbers and words
#   count from starting to ending and print the count
#   when divisible by 3 -> Fizz
#   when by 5 -> Buzz
#   when both -> FizzBuzz

# How to do that
# start counter
# check if counter is divisible
#   print number or statement

# Data structure / Algorithm
# start upto end
#   if number % 3 == 0 && number % 5  is 0
#       print FizzBuzz
#   if else only 3
#   if else only 5
#   else -> print number

def fizzbuzz(start, ending)
  result = []
  start.upto(ending) do |count|
    result << fizzbuzz_value(count)
  end
  puts result.join(", ")
end

def fizzbuzz_value(count)
  case
  when count % 3 == 0 && count % 5 == 0
    'Fizzbuzz'
  when count % 3 == 0
    'Fizz'
  when count % 5 == 0
    'Buzz'
  else
    count
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
