# Cute Angles

# Problem:
# Write a method that turns an angle from degree to degree, minute, second
# angle is float
# a degree has 60 minutes
# a minute has 60 seconds
# use degree symbol below, ' for minute " for second

# input: float
# output: string

# How to turn float into degrees, minuts and seconds?
# degrees is part before point -> sustract the integer from float
# rest is the minutes and seconds
# multiply by 60 to get minutes -> subtract the int for seconds
# mulitply rest by 60 and just take the int again

# test cases: below

# data structure / algorithm
# SET degree to int of float
# SET temp to float - degree * 60
# SET minutes to temp.to_i
# SET seconds to temp - minutes * 60
# use format to format the Finalstring

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  degrees %= 360
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts dms(30) == %(30°00'00")
puts dms(400)
puts dms(400) == %(40°00'00")
puts dms(-40)
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
