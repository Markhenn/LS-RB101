# Letter Counter (Part 2)

=begin
Problem:
Improve the last method to not count non letters

check if word contains a non letter
delete that non letter

test cases: 
see below

data structure:
input: string
output string

algorithm:
call only_letters on word
---
word.delete("^a-z")
=end

def only_letters(word)
  word.delete("^A-z")
end

def word_sizes(text)
  counts = Hash.new(0)
  text.split.each do |word|
    word = only_letters(word)
    counts[word.size] += 1
  end
  counts
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
