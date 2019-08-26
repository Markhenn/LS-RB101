# Now I Know My ABCs

# Problem
# check if a word can be spelled from the block list
# input: string
# output: bool

# case insensitive

# Whats a block?
#  A block contains 2 letters.
#  only one of these letter can be used for spelling
# when one has been used the other is out -> false

# Data structure
# Blocks as subarrays

# Algorithm
# Iterate over block list
# check if both letters from the block are in the string
#   if yes return false
require 'pry'
require 'pry-byebug'

BLOCK_LIST = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word1?(text)
  word = text.upcase
  answer = true
  BLOCK_LIST.each do |(first, second)|
    if /#{first}/ =~ word && /#{second}/ =~ word
      answer = false
    end
  end
  answer
end

p block_word?('BO') == false
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# LS Solution
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end
