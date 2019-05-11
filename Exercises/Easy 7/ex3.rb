# Capitalize Words

# Problems:
# Input: string
# Output: string
# string has words -> each word capitalized
# downcased inside a word
# no mutation

# How to do it
#   Use downcase first
#   then split and use capitalize
#   join on blanks

# Data structure / algorithm
# downcase -> split -> map -> capitalize -> join(' ')

def word_cap1(words)
  words.split.map(&:capitalize).join(' ')
end

def word_cap2(words)
  words.split.map do |word|
    word[0].upcase + word[1..-1].downcase
  end.join(' ')
end

def word_cap(words)
  capitalized = ''
  word_ary = words.split
  word_ary.each do |word|
    capitalized << word[0].upcase + word[1..-1].downcase
    capitalized << ' ' unless word_ary.last == word
  end
  capitalized
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
