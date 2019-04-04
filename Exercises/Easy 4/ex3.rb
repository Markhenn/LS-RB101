# Leap Years 

=begin
Problem: leap years occur in every year that is evenly divisible by 4 
unless the year is also divisible by 100. 
If the year is evenly divisible by 100 
then it is not a leap year 
unless the year is evenly divisible by 400.

input: integer (year)
output: boolean

if year % 100 == 0 && year % 400 == 0
  return true
elsif year % 100 == 0
  return false
elsif year % 4 == 0 
  return true
else
  false
end

test cases:
see below

data structure: 
input int
output: boolean

Algorithm see above
=end

def leap_year(year)
  (year % 400 == 0) || (year % 100 != 0 && year % 4 == 0)
end

def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      if year % 400 == 0
        true
      else
        false
      end
    else
      true
    end
  else
    false
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

