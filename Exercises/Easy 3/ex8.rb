# Palindrom String

=begin
Problem: a method that returns true if a string is a palindrom
palindrom -> can be read forward and backward - all chars matter
input: string
output: boolean
test cases:
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true
data structure:
input: string
output: boolean
Algorithm:
reverse string and see if it is the same as the original string
=end

def palindrome?(string)
  string.reverse == string
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

def palindromic_number?(int)
  palindrome?(int.to_s)
end


puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
