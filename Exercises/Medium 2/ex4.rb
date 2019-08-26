# Matching Parentheses?

# Problem
# find out if all paratheses open and close corretly
# input: string
# output: boolean

# a matching pair must start with a ( and end end with a )
# cant have a ) without and (
# cant have a ( at the end

# How to calculate matching pairs
# parens + 1 for (
# parens -1 for )
# end of string parens needs to be 0
# cant be -1 at any point during the interation

# Data Structure / Algorithm
# split string into chars
# set parens = 0
# each on chars
#   when open p add +1 to parens
#   if close p -1 to parens
# if parens is -1 break

# if parens is not 0
#   return false
# else
#   true

def balanced?(text)
  parens = 0
  text.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'

    break if parens == -1
  end

  parens.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# FE

require 'pry'
require 'pry-byebug'

SIGNS = {
  ')' => '(',
  ']' => '[',
  '}' => '{'
}

CLOSING_SIGNS = SIGNS.keys
OPENING_SIGNS = SIGNS.values

QUOTES = %w(' ")

def pairs_balanced?(pairs)
  pairs.values.all?(&:zero?)
end

def closing_sign_first?(pairs)
  pairs.values.each do |count|
    return true if count < 0
  end
  false
end

def marks_balanced?(text)
  QUOTES.each do |quote|
    count = text.chars.count { |char| char =~ /#{quote}/ }

    return false unless count.even?
  end
  true
end

def extended_balance?(text)
  pairs = Hash.new(0)
  text.each_char do |char|
    pairs[SIGNS[char]] -= 1 if CLOSING_SIGNS.include?(char)
    pairs[char] += 1 if OPENING_SIGNS.include?(char)

    return false if closing_sign_first?(pairs)
  end

  pairs_balanced?(pairs) && marks_balanced?(text)
end

puts '--'
p extended_balance?('hey {') == false
p extended_balance?('hello (madam) I will be {your} guide') == true
p extended_balance?("hello (madam) I'll be {your} guide") == false
p extended_balance?('hello (madam') == false
p extended_balance?('} next {') == false
p extended_balance?("I 'love' you") == true
p extended_balance?('I "would" love to meet ya') == true
