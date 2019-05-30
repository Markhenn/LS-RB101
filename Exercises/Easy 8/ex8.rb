# Double Char (Part 2)

# Problem
# input: string
# output: string
# like before, but just consonants

def double_consonants(text)
  double_string = ''
  text.each_char do |char|
    double_string << char
    double_string << char if char =~ /[a-z&&[^aeiou]]/i
  end
  double_string
end

puts double_consonants('String')
puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
