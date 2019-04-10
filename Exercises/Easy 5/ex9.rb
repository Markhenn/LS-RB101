# ddaaiillyy ddoouubbllee

=begin
Problem:
input a string
returns a new string
that contains the value of the original string
  with all double chars numbers removed
  You may not use String#squeeze or String#squeeze!.

create new_string
char = Get first char and add to new_string
compare to next char
  if next char is different
    add to new_string
    char = next char
  end

test cases:
see below

data structure:
input: string
output: string

algorithm:
use gsub to filter out doubles
=end

def crunch(text)
  text.gsub(/(.)\1+/, &:chr)
end

def crunch1(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

def crunch2(text)
  crunch_text = ''
  text.chars.reduce('') do |last_char, char|
    crunch_text << char unless char == last_char
    char
  end
  crunch_text
end

def crunch0(text)
  crunch_text = ''
  text.each_char.each_with_index do |char, index|
    crunch_text << char unless char == text[index + 1]
  end
  crunch_text
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
