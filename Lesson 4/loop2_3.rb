# Conditional Loop

# Problem:
# Input: boolean
# Output: print statement
# use and if statement
# put a loop if the statement is true
# but else with no loop
# Does it make sense to have loop that just runs 1 time?

# Test Cases: given

# Data structure / algorithm
# IF process_the_loop is true
#   loop start
#     puts "The loop was processed!"
#     break the loop
# ELSE
#    puts "The loop wasn't processed!"

process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed!"
    break
  end
else
  puts "The loop wasn't processed!"
end
