# Name Swapping

# Problem
# input: string
# output: string
# move data around in a string

# Data structure / Algorithm
# split string
# interpolate array data

def swap_name(string)
  string.split.reverse.join(', ')
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
