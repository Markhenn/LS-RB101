# Next Featured Number Higher than a Given Value

# Problem
# Return the next feature number
# what a feature number
#   odd
#   a multiple of 7
#   not digit comes more than once

# input: int
# output: int -> next feature number bigger than argument

# How to do it
# loop until number is found
# break when number is found
# add 1 to number

# return number
# if number to big return nil

def different_digits?(number)
  num_ary = number.to_s.chars
  num_ary.uniq == num_ary
end

def featured_number?(number)
  number.odd? && number.modulo(7) == 0 && different_digits?(number)
end

def featured(number)
  loop do
    number += 1
    return nil if number > 9_999_999_999
    break if featured_number?(number)
  end
  number
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999).nil?
