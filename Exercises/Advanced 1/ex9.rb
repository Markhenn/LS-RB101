# Egyptian Fractions

# Problem
# 2 functions 1 to create egytian fractions another to get the rational value

# create egytian fractions
# input: a rational value
# output: array with denominators for egyptian fractions

# how to do it
# take denominators up from 1 to n
# get the rational of 1, number
#   check if sum of number and array is bigger, smaller, equal to result
#   when equal, push to array and return
#   when smale, write number to array
#   when bigger, next

# Data structure / Algorithm
# SET egyptian array = []
# count = 1
# loop
#   result is calculate rational <=> rational input
#   if result.zero? -> return egytptian.push(count)
#   elsif result == -1,  push count to array
#   count += 1

# calculate rational
# rational 1, count + loop array rational 1, element

def egyptian(rational)
  denominators = []
  denominator = 1

  until rational == 0
    if Rational(1, denominator) <= rational
      denominators << denominator
      rational -= Rational(1, denominator)
    end

    denominator += 1
  end
  denominators
end

def unegyptian(denominators)
  denominators.reduce(0) { |sum, num| sum + Rational(1, num) }
end

p egyptian(Rational(2, 1))
# -> [1, 2, 3, 6]
p egyptian(Rational(137, 60))
# -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))
# -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
