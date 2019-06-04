# Uppercase Check

# Problem
# input: string
# output: boolean
# check if all letters are capitalized
#   yes -> true
# non alphebetics do not count

# Data structure / algorithm
# compare string against the string capitalized

def uppercase?(text)
  text == text.upcase
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true

# Further Exploration
# It makes sense because there are no letters in there
#   false means that there are downcase letters
#   the method should only check for uppercase
#   not if there are any letters at all
#   thats for another method
# If the string only has non alphabetics, it will return true as well
