# What century is that?

=begin
Problem: create method that takes a year as integer as input and 
returns the century it belongs to. 1901-2000 comprise the 20th century
starts with:
1-100 -> 1st
101-200 -> 2nd
201-300 -> 3rd
301-400 -> 4th
401-500 -> 5th
...
1901-2000 -> 20th
2001-2100 -> 21st
2101-2200 -> 22nd
...
2901-3000 -> 30th
3001-3100 -> 31st
...
9901-10000 -> 100th
10001-10100 -> 101st

x-1 / 100 + 1
x = 1 => 1
x = 5 => 1
x = 100 => 1
x = 101 => 2
x = 1999 => 20
x = 11201 => 113

if last 2 digit
  == 1 st
  == 2 nd
  == 3 rd
  == 4..10 th
  == 11 th
  == 12 th
  == 13 th
  == 14..20 th
  == 21 st
  == 22 nd

  string_century = ((year - 1) / 100 + 1).to_s

  if string_century[-2] == 11 || 12 || 13
    return string_century + "th"
  elsif string_century[-1] == 1
    return string_century + "st"
  elsif string_century[-1] == 2
    return string_century + "nd"
  elsif string_century[-1] == 3
    return string_century + "rd"
  else
    return string_century + "th"
  end

Test cases:
puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'

data structure:
input: integer
calculate century and turn into string
output: string

Algorithm:
calculate century from year
turn into string
check if strings last 2 chars are 11, 12, 13 -> return th
check for string last char 1, 2, 3, return appropiate
else return th
=end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)

  case century % 10
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

def century(year)
  century = ((year - 1) / 100 + 1)
  century.to_s + century_suffix(century)
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
