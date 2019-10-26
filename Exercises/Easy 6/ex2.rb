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


# `line 19` defines the method `remove_vowels` with one parameter calleds `words`
# the Array#map is called on the local variable words passing in a single line block as argument with one parameter called `word`. The String#delete method is called on the local variable `word` passing in a String Object with the value of `"aeiouAEIOU"`
#
# `line 23` invokes the method Kernel#puts passing in the following argument.
# the `remove_vowels` method is called with an array Object with the value of `%w(abcdefghijklmnopqrstuvwxyz)` on the return value the Array#== ist called passing in an array object with the value of `%w(bcdfghjklmnpqrstvwxyz)` as an argument
# the method `remove_vowels` returns an array object
# this is a definition of how to remove letter from a string Object