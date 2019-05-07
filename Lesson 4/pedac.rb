# PEDAC approach

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# Problem:
# Input: string
# Output: String or Array -> Ask
#   When String -> same object or different -> ask
# Explicit:
#   return only the substrings that are palindromes 
#   mom is correct, Mom not (case sensitivity)
# Implicit:
#   return array with each substring in it
#   parts of strings matter not separate words
#   substrings of returned strings matter 
#     "abcddcbA" == ["bcddcb", "cddc", "dd"]
#       here see case sensitivity
#   empty string == empty array
#   no palindrom == empty array
# Questions:
# how about not sting input
# how about more words than 1
# how about numbers and non letter


# Complete PEDAC
# input: a string
# output: an array of substrings
# rules: palindrome words should be case sensitive, meaning "abBA"
#        is not a palindrome

# Algorithm:
#  substrings method
#  =================
#  - create an empty array called `result` which will contain all
#    the required substrings
#  - initialize variable start_substring_idx and assign 0 to it.
#  - initialize variable end_substring_idx and assign value of
#    start_substring_idx + 1 to it.
#  - Enter loop which will break when start_substring_idx is equal
#      to str.size - 1
#    - Within that loop enter another loop which will break if
#      end_substring_idx is equal to str.size
#      - append to the result array part of the string from
#        start_substring_idx to end_substring_idx
#      - increment `end_substring_idx` by 1.
#    - end the inner loop
#    - increment `start_substring_idx` by 1.
#    - reassign `end_substring_idx` to `start_substring_idx += 1`
#  - end outer loop
#  - return `result` array

#  is_palindrome? method
#  =====================
#  - check whether the string value is equal to its reversed
#    value. You can use the String#reverse method.

#  palindrome_substrings method
#  ============================
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#    - if the word is a palindrome, append it to the result
#      array
#  - return the result array