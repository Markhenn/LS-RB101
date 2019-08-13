# Word to Digit

# Problem
# Method turn word digits into number digits
# input: string
# output: string
# five becomes 5 in the string
# What about an empty string?
# not a string?

# Example / Test cases
# see below

# Data Structure / Algorithm
# Split string
# Evaluate each substring
#   if number digit -> convert
#   else keep it
# join the array again

# use starts with and maybe regex to avoid a problem with four.

# How to use regex

require 'pry'
require 'pry-byebug'

DIGITS = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9',
  'zero' => '0'
}

def word_to_digit(string)
  DIGITS.keys.each do |digit|
    string.gsub!(/\b#{digit}\b/i, DIGITS[digit])
  end
  string
end

def word_to_digit_no_space(string)
  DIGITS.keys.each do |digit|
    string.gsub!(/(?<=(\d| ))#{digit}( |\b)/i, DIGITS[digit])
  end
  string
end

def word_to_phone_number1(string)
  compact_string = word_to_digit_no_space(string)
  compact_string.gsub!(/\d{10}/) do |number|
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
end

def word_to_phone_number(string)
  compact_string = word_to_digit_no_space(string)
  compact_string.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
end

p word_to_digit('Please call me at Five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

p word_to_digit_no_space('Please 1 2 call me at Five five five one two three four seven eight nine. Thanks.') == "Please 1 2 call me at 5551234789. Thanks."

p word_to_phone_number('Please 1 2 call me on the phone. My phonenumber is Five five five one two three four seven eight nine. Thanks.') == 'Please 1 2 call me on the phone. My phonenumber is (555) 123-4789. Thanks.'

# FE
# use regex to remove the spaces between the numbers you are changing, look for spaces first and then change the numbers

# get a list of positions for a match and put into an array
# go over the string and exchange based on the position
# make an if to check if the position is followed by another digit word

# change a 10 digit number into a phone format: (123) 456-7890
