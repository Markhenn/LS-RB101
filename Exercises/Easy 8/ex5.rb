# Palindromic Substrings

# Problem
# return all substrings that are palindromes (read the same forward and back)
# use ex4 method
# case and special characters matter
# return all substrings in the order found
# return double subtrings as well
# single characters a no palindroms
# input: string
# output: array of strings
# How to find a palindrom?
# compare the first and last char until you reach the middle
# every pair must be the same

# Data structure / Algorithm
# Get all substrings from method substrings
# call select on sub ary

def substrings_at_start(string)
  result_array = []
  0.upto(string.size - 1) do |index|
    result_array << string.slice(0..index)
  end
  result_array
end

def substrings(string)
  substrings = []
  (0..string.size).each do |start_index|
    substrings.concat(substrings_at_start(string[start_index..-1]))
  end
  substrings
end

def palindromes(string)
  substrings_ary = substrings(string).delete_if { |element| element.size == 1 }

  substrings_ary.select do |substring|
    substring == substring.reverse
  end
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further exploration

# Problem
# modify the method to ignore non alphanumerics and case
# case: make all characters in substring lower case
# alphanumeric: delete all non alphanumerics from subsstring
# create a new method that references substring
# shall the non alphanumerics be returned or not?

def clean_substring(substring)
  substring = substring.downcase.delete "^a-z0-9"
  puts substring
  substring
end

def palindromes2(string)
  substrings_ary = substrings(string)

  substrings_ary.select do |substring|
    substring = clean_substring(substring)
    substring == substring.reverse && substring.size > 1
  end
end

puts palindromes2('Abcba') == ['Abcba', 'bcb']
puts palindromes2('Ab-cba') == ['Ab-cba', 'b-cb']
puts palindromes2('1Ab-cba') == ['Ab-cba', 'b-cb']
puts palindromes2('A-c1-1cba')
