# Lettercase Percentage Ratio

# Problem
# count different kinds of characters in a string and give a percentage
# input: string
# Output: hash

# count lowercase -> divide by string lenght * 100
# count uppercase -> divide by string lenght * 100
# 100 - uppercase - lowercase is rest

# Data structure / algorithm
# Set the string length
# Set the counts hash
# counts hash with key :lowercase = string count lowercase * 100 / string length
# same for uppercase
# neither = 100 - uppercase - lowercase

def letter_percentages(text)
  text_length = text.size
  percentages = {}

  percentages[:lowercase] = format_percentage(text.count("a-z") * 100.00 / text_length)
  percentages[:uppercase] = format_percentage(text.count("A-Z") * 100.00 / text_length)
  percentages[:neither] = 100.00 - percentages[:uppercase] - percentages[:lowercase]

  percentages
end

def format_percentage(number)
  format("%0.2f", number).to_f
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI') == { lowercase: 66.67, uppercase: 33.33, neither: 0.0 }
p letter_percentages('abcdefGHI')
