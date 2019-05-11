# Swap Case

# Problem:
# Input: string
# Output: string
# swap lowercase and uppercase and vice versa
# dont use String#swapcase

# Data structure / algorithm
#   Split into chars
#   map
#     match /a-z/
#       to upcase
#     else
#       to downcase
#   join(' ')

def swapcase(text)
  characters = text.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    else
      char.downcase
    end
  end
  characters.join('')
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
