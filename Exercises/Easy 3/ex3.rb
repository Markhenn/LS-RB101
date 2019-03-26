# Count characters in words

=begin
Problem: Count characters in a word or sentence given by the user. 
spaces do not count
input: string
output: display
Examples:
puts count_characters('walk') == 4
puts count_characters('walk, don't run') == 13
Data structure:
input: string
Algorithm:
split string into array at the spaces
join array withput spaces
get length of string
display result
=end

def count_characters(sentence)
  sentence.delete(' ').length
end

def start_program
  print "Please write word or multiple words: "
  string = gets.chomp
  character_count = count_characters(string)

  puts "There are #{character_count} characters in \"#{string}\"."
end

start_program
