# Welcome Stranger

# Problem
# Input: an array, a hash with :title and :occupation
# Output: print
# the method prints a greeting
# the array is the name of the person
# use the hash for title and occupation

# Data structure / algorithm
# join array to a string
# add title and occupation to a string
# put string and interpolate the values from string and hash

def greetings(names, details)
  full_name = names.join(' ')
  full_title = details[:title] + ' ' + details[:occupation]
  puts "Hello, #{full_name}! Nice to have a #{full_title} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
