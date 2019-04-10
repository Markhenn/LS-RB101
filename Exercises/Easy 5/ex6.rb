# Letter Counter (Part 1)

=begin
Problem:
Input: String with one or more space separated words
return a hash that shows the number of words of different sizes
Words consist of any string of characters that do not include a space.

loop over each word
analyse size of word
add +1 to to hash with size as key
return the hash

test cases:
see below

data structure:
input: string
turn into an array
fill a hash
output: hash

Algorithm:
SET hash with default 0
split string
each array element
  hash[element.size] += 1
end
return hash
=end

def word_sizes(text)
  counts = Hash.new(0)
  text.split.each { |word| counts[word.size] += 1 }
  counts
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}
