# Lettercase Counter

# Problem:
# input: string
# output: hash
# create a hash with 3 keys (each a symbol)
#   lowercase, uppercase, neither
#   the values will be the counts from the string
#   empty string results in zeros as values

# How to do that
#   split the string in chars
#   decide for each char were it belongs
#   add 1 to the right category

# Data structure / algorithm
# SET hash with keys to value 0
# Split string
# each
#   if matching lower
#     lowercase += 1
#   elsif upper
#     ...
#   else
#     ...
# return hash

def letter_case_count(text)
  case_count = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }

  text.chars.each do |char|
    if char =~ /[a-z]/
      case_count[:lowercase] += 1
    elsif char =~ /[A-Z]/
      case_count[:uppercase] += 1
    else
      case_count[:neither] += 1
    end
  end
  case_count
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# LS Solution

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end
