# Longest Sentence

# Problem
# find the longest senctece in a text file
# input: file with text
# output: display the longest sentence and the number of words

# sentence ends with . ! ?
# spaces mark word endings

# use regex to separate words and put into an array
# reduce on array with with count for words

# test cases
# see below

# Data structure / algorithm
# import file
# readfile in variable
# use regex to separate sentences into an array
# use reduce to find longest sentence
# print sentence
# print word count of sentence

# set up text file input - (\.|!|\?)

def longest_sentence(text)
  longest_sentence = text.split(/(?<=!|\.|\?)\s/).reduce('') do |longest, current|
    if current.split.size > longest.split.size
      current
    else
      longest
    end
  end
  p longest_sentence
  p longest_sentence.split.size
end

text = 'This test. is a -- long test! or is this one longer it? Yes.'

text1 = File.read('text1.txt')
text2 = File.read('text2.txt')

#longest_sentence(text1)
#longest_sentence(text2)

# LS Solution
text = File.read('text1.txt')
sentences = text.split(/(?<=\.|\?|!)\s/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

#puts "#{largest_sentence}"
#puts "Containing #{number_of_words} words"

# FE
def longest_word(text)
  words = text.gsub(/\.|\?|!|,/, ' ').split(/\s/)
  longest_word = words.max_by { |word| word.size }
  puts longest_word
  puts longest_word.size
end

longest_word(text1)
longest_word(text2)

def longest_paragraph(text)
  paragraphs = text.split(/\n\n/).map { |paragraph| paragraph.gsub(/\n/, ' ') }
  longest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size}
  p longest_paragraph
  p longest_paragraph.split.size
end

longest_paragraph(text1)
longest_paragraph(text2)
