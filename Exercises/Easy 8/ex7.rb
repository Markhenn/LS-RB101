# Double Char (Part 1)

# Problem
# input: string
# output: string
# method doubbles each char in string

# Data structure / Algorithm
# SET new string
# call each char on string
#   push 2x each char to new string
# return string

def repeater(text)
  double_string = ''
  text.each_char { |char| double_string << char * 2 }
  double_string
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
