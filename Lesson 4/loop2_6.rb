# Empty the array

# Problem:
# Input: array
# Output: Display elements of array
# Do we need to check that it is an array?
# Could the array be empty

# Remove item from array and display each one
# use a loop for that

# Test cases: given

# Data Structure / algorithm
# START loop
# break if empty
# SET name to first element of array
# Delete first element of array
# loop end

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  break if names.empty?

  name = names[0]
  names = names[1..-1]
  puts name
end
