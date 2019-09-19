# Reverse Sentence

def reverse_sentence1(sentence)
  words = sentence.split
  reversed_words = []

  i = 0
  while i < words.length
    # reversed_words.unshift(words[i])
    reversed_words = [words[i]] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

def reverse_sentence(sentence)
  sentence.split.each_with_object([]) do |word, rev|
    rev.unshift(word)
  end.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'
