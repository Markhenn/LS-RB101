# After Midnight (Part 2)

=begin
Problem:
Write two methods, each take a string with time '00:00'
one gives the minutes after minutes and one before midnight
Return values from 0..1439
not date or time method

after midnight
split in hour and minute
(hour * 60 + minute) % 1440 -> modulo for 24:00
before midnight
split in hour and minute


test cases:
see below

data structure:
input: string
output int

Algorithm:
Define constants for minutes per hour, minutes per day, hours per day
hour, minute = string.split(':')
(hour * 60 + minute) % 1440 
or
(24 - hour) * 60 - minute) % 1440
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def after_midnight1(string)
  hour, minute = string.split(':').map(&:to_i)
  (hour * MINUTES_PER_HOUR + minute) % MINUTES_PER_DAY
end

def before_midnight(string)
  hour, minute = string.split(':').map(&:to_i)
  ((HOURS_PER_DAY - hour) * MINUTES_PER_HOUR - minute) % MINUTES_PER_DAY
end

def before_midnight_staff(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

MIDNIGHT_SUNDAY = Time.new(2019, 1, 6)
SECONDS_PER_MIN = 60

def after_midnight(time_str)
  hour, minute = time_str.split(':').map(&:to_i)
  new_time = MIDNIGHT_SUNDAY + (hour * MINUTES_PER_HOUR + minute) * SECONDS_PER_MIN
  ((new_time - MIDNIGHT_SUNDAY) / SECONDS_PER_MIN).to_i % 1440
end



puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
