# Clean up the words

=begin
Problems:
take a string and exchange all non alphabetic characters with spaces
only one space if more than one non alphabetic follow each other
never have consecitive spaces

test cases:
see below

data structure:
input: string
output: string

Algorithm:
see if there is a clean up function gsub
remove extra spaces (squeeze(' '))
return new string
=end

ALPHA = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def cleanup1(string)
  string.gsub(/[^[:alpha:]]/i, ' ').squeeze(' ')
end

def cleanup(text)
  new_string = ''
  text.each_char do |char|
    new_string << if ALPHA.include?(char.downcase)
                    char
                  else
                    ' '
                  end
  end
  new_string.squeeze(' ')
end

puts cleanup("---What's my +*& line?") == ' What s my line '
puts cleanup("---What's my +*& line?")
