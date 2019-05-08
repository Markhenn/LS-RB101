# Delete vowels

# Problem:
# input: array of strings
# output: array of strings
# method that deletes the vowels from the strings
# capitalization doesnt matter

# Questions?
#   Empty array?
#   not an array?
#   validation?

# Data structure / algorithm
# call map on array
#   call reject on denominator
#     check if char matches vowel

def remove_vowels(words)
  words.map { |word| word.delete "aeiouAEIOU" }
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
