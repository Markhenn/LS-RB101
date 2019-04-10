# After Midnight (Part 1)

=begin
Problem:
A method that converts an integer into a time of the day
positive -> after midnight
negative -> before midnight
dont use time or date classes
integer is the minutes away from midnight
0 -> 00:00
24 * 60 -> 1440 -> 00:00
60 -> 01:00
90 -> 01:30
120 -> 02:00

formular:
minutes / 60 = hours
minutes % 60 = minutes
hours, minutes = minutes.divmod(60)

When more than 24 h
if hours / 24 > 1
  hours %= 24
end

test cases:
see below

data structure:
input: int
output string

Algorith:
hours, minutes = minutes.divmod(60)

check if hours is bigger than 24
if hours bigger than 24
  hours %= 24
end
0 + hours
0 + minutes
format hours and minute to '00' when less than 10
return "#{hours}:{minutes}"

=end

MINUTES_AN_HOUR = 60
HOURS_A_DAY = 24

def time_of_day1(minutes)
  hours, minutes = minutes.divmod(MINUTES_AN_HOUR)
  hours %= HOURS_A_DAY

  hours = HOURS_A_DAY + hours if hours < 0
  format('%02d:%02d', hours, minutes)
end

MINUTES_PER_DAY = HOURS_A_DAY * MINUTES_AN_HOUR

def time_of_day2(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_DAY
  puts delta_minutes
  hours, minutes = delta_minutes.divmod(MINUTES_AN_HOUR)
  format('%02d:%02d', hours, minutes)
end

MIDNIGHT_SUNDAY = Time.new(2019, 1, 6)
SECONDS_PER_MIN = 60

def time_of_day(minutes)
  new_time = MIDNIGHT_SUNDAY + minutes * SECONDS_PER_MIN
  new_time.strftime('%H:%M')
end

def time_of_weekday(minutes)
  new_time = MIDNIGHT_SUNDAY + minutes * SECONDS_PER_MIN
  new_time.strftime('%A %H:%M')
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
puts time_of_weekday(-4231) == "Thursday 01:29"
puts time_of_weekday(-4231)
