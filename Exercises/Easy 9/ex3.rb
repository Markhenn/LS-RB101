# Always Return Negative

# Problem:
# input: number
# output: number (negative except 0)
# always return the negative of the number

# Data structure / Algortihm
# if number is negtaive -> return number
# else number * -1

def negative(number)
  number.negative? ? number : -number
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0
