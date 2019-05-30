# Get The Middle Character

# Problem
# input: string
# output: string
# method returns the middle character/s
# for odd strings 1
# for even strings 2

# Data Structure / Algorithm
# if size odd
#   return string at position half size
# else
#   return string at poistion half size -1 to half size

def center_of(text)
  center_index = text.size / 2
  if text.size.odd?
    text[center_index]
  else
    text[center_index - 1, 2]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch')
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
