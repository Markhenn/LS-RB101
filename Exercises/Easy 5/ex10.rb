# Bannerizer

=begin
Problem:
input: a short line of text,
output: print it within a box.

x = size of text
when x == 0
  puts +--+
  puts |  |
  puts |  |
  puts |  |
  puts +--+

when x > 0
  puts +-"-"*size-+
  puts | ""*size |
  puts | "text" |
  puts | ""*size |
  puts +-"-"*size-+

extra:
make the message fit in 80 columns
make a longer than 80 message wordwrap

split text in array of words
SET new text
index = 0
loop over text_ary until empty
    if new_text.size + text_ary[0].size + ' '  is less than max length
      new_text << text_ary.shift + ' '
    else
      puts "| new_text + " "*(new_text.size-max_length)|"
    end
  end
  

test cases:
see below

data structure:
input: string
output: print

algorithm:
GET text_length = text.size
puts "+-#{- * text_length}-+"
puts next line with empty
puts text line
puts next line with empty
puts last line like top
=end

MAX_LENGTH = 76

def print_in_box1(text)
  text_length = text.size
  if text_length > MAX_LENGTH
    text = text.slice(0..MAX_LENGTH - 1)
    text_length = MAX_LENGTH
  end

  box_line = "+-#{'-' * text_length}-+"
  empty_line = "| #{' ' * text_length} |"
  text_line = "| #{text} |"
  puts box_line
  puts empty_line
  puts text_line
  puts empty_line
  puts box_line
end

def print_with_wrap(text)
text_ary = text.split
new_text_ary = []
new_text = ''
  loop do
    break if text_ary.empty? && new_text.empty?
    
    if new_text.size + text_ary.size + 1 > MAX_LENGTH || text_ary.empty?
      new_text_ary << new_text
      new_text = ''
    else
      new_text << text_ary.shift + ' '
    end
  end

  new_text_ary.each do |texts|
    puts "| #{texts + ' ' * (MAX_LENGTH + 1 - texts.size)}|"
  end
end

def print_in_box(text)
  text_length = text.size
  text_length = MAX_LENGTH if text_length > MAX_LENGTH

  box_line = "+-#{'-' * text_length}-+"
  empty_line = "| #{' ' * text_length} |"
  puts box_line
  puts empty_line
  print_with_wrap(text)
  puts empty_line
  puts box_line
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('To boldly go where no one has gone before and this message is way to long for a terminal window to print without wrapping. Which means the text has to wrap around a few times.')
print_in_box('')
