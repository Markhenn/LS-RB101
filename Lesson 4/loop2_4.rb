# Get the sum

# Problem:
# Input: an integer
# Output: print statement
# Get a user input and validate the answer
# loop until you get the answer
# Do we have to validate that it is an integer?
# What happens if it is not an integer?

# Test cases: given

# Data structure / Algorithm
# start below setting answer
# IF answer is 4
#   puts "That's correct!"
#   break out of loop
# ELSE
#   puts "Wrong answer. Try again!"

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  end
  puts "Wrong answer. Try again!"
end
