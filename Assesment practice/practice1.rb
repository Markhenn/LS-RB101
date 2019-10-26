# Code Session Practice

# Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

# Problem
# output: int
# input: string
# count distinct case insensitive alphabetic characters and digits that occur more than once
#
# data structure: string, array
#
# algorithm 
# set a hash with default 1
# iterate over string
#   make characters downcase 
#   use characters as key for hash and add 1 for each occurrence
# go over hash and count how many values are biger than 1 -> return the result

def duplicate_count(str)
  result = Hash.new(0)

  str.each_char do |char|
    result[char.downcase] += 1
  end

  result.values.count { |char| char > 1 }
end

p duplicate_count("") #== 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
