# Madlibs Revisited

# Problem
# a madlibs that adds words to a random external text
# input: a text file (strings line by line)
# output: print of each line with added text

# How to save the nouns, adjectives, adverbs and verbs
# how to read and save the text that the program can
# choose the appropiate category

# Data Structure
# A hash for the random words for the exchange
# The text file will have the category instead of a word written
#   the adjective adjective noun adverb verb the adjective adjective...

# Algorithm
# import text as a string
# Split into words
# go over each word
#   if code word is found
#     replace with radom word from hash
# join the string again and print

WORDS = {
  'noun'      => %w(dog cat hair tail bone sheep coffee grass table shirt tree bush),
  'adverb'    => %w(comically beautifully aggressively noisily hungrily well matter-of-factly),
  'verb'      => %w(eat lick see stroke play run fall drink bike drive),
  'adjective' => %w(blue brown yellow big small fast smelly wooden healthy sickly beautiful)

}

def madlibs(text)
  WORDS.keys.each do |word|
    text.gsub!(/#{word}/) do |match|
      WORDS[match].sample
    end
  end
  text
end

text = File.read('text1.txt')

p madlibs(text)


# LS Solution

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('text2.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end