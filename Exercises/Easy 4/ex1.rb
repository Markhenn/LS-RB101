# Short Long Short

=begin
Problem: A method that checks two strings for length
then concatenates the short, the long and the short again
input: string, string
output: string
Test cases Examples: 
puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
Data structure:
input: string, string
output: string
Algorithm:
if string1.size > string2.size
  return string2 + string1 + string2
else
  return string1 + string2 + string1
=end

def short_long_short(string1, string2)
  if string1.size > string2.size
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
