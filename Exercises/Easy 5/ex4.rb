# Letter Swap

=begin
Problem:
inputs a string of words separated by spaces
change first and last letter of every string
output changed string

use slice

test cases:
see below

data structure:
input: string
output string

Algorithm
split the string into an array of words
take every word and change first and last letter
add every word back to an array
join the array
=end

def swap(words)
  words.split.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Oh what a wonderful day it is')
puts swap('Abcde') == 'ebcdA'
puts swap('Abcde')
puts swap('a') == 'a'
