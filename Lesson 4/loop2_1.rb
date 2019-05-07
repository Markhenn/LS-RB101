# Even or Odd

# Problem
# input: none
# output: print a number and tell if it is odd or even
# use the given loop

# Test Cases
# numbers 1-5

# Algorithm / Data Structure:
# start in loop
# break if count bigger than 5
# IF counter is even
#   print counter is even!
# ELSE
#   print counter is odd!

count = 1

loop do
  break if count > 5

  if count.even?
    puts "#{count} is even!"
  else
    puts "#{count} is odd!"
  end
  count += 1
end
