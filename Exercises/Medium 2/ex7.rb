# Unlucky days

# Problem
# how many friday 13th are in a given year
# input: int as year
# output: int as number of 13th

# start in 1752
# a year has 365 days / 366 when leap year

# how to calculate how many friday the 13th are in a year?
# set to a hash the 7 outcomes for a leap year and the 7 for not a leap year
#   when the 1.1.xxxx is a monday=>x, tuesday=>y ...
#   in total 2x7 keys

# 0 key is saturday count from there
# 2 monday
# 4 wednesday
# 6 friday

# calculate if year is a leap year - done
# calculate what weekday the year starts
#   do a recursion
#   if year == 1752
#     return 0
#   else
#     if year - 1 is leap year
#       what_weekday(year-1) + 2
#     else what_weekday(year - 1) + 1

# leap? = :leap if year is leap_year
# weekday = what_weekday? % 7
# pick the value from hash[leap?][weekday]

require 'date'

def leap_year(year)
  (year % 400 == 0) || (year % 100 != 0 && year % 4 == 0)
end

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# FE calculate how many 5 fridays a month are in a year

# set date to 1.1

# fridays = Hash.new(0)
# check if friday
# add + 1 day -> check again
# when friday +1 to friday counter, fridays[month] += 1

# count how many instaces of 5 are in the hash values

def five_fridays(year)
  fridays = Hash.new(0)
  friday = Date.new(year)
  loop do
    break if friday.friday?

    friday += 1
  end

  while friday.year == year
    fridays[friday.month] += 1

    friday += 7
  end
  fridays.values.select { |month| month == 5 }.size
end

p five_fridays(2019)
