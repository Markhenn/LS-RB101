# The End Is Near But Not Here

# Problem
# Input: string
# Output: string
# return the next to last word from string
# at least two words in string

# Data structure / algorithm
# split into words
# [-2]

def penultimate(text)
  text.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# LS Exploration

# Problem
# Input: string
# Output: string
# return the word in the middle of the string

# Edge cases:
#   empty string?, 1 word strings -> return empty
#   even number of words in string -> take the second of the two middle words
#   non word string parts (numbers, extra signs) -> count as words

# Data structure / algorithm
# if ary.size <= 1 -> return ''
# Split text
# [ary.size / 2]

def middle_word(text)
  words = text.split
  return '' if words.size <= 1

  words[words.size / 2]
end

p middle_word('last word') == 'word'
p middle_word('last') == ''
p middle_word('Launch School is great!') == 'is'
p middle_word('Launch School is really great!') == 'is'
p middle_word('') == ''
