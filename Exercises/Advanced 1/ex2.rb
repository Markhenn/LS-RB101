# Seeing Star

# Problem
# Display 8 pointed stars
# input: int (height and width of star)
# output: display of the star

# min input: 7 only odd numbers

# Write the star line by line
# middle line has n stars
# all lines except middle have 3 stars
# the empty space varies on each line
# all lines:
# empty times row star empty times (n-3-row*2)/2 star empty star empty times row

# Data Structure / Algorithm
# Set array for star lines
# repeat from 0 to (n - 1) / 2 (use times)
#   Write star line as above to array

# add a row with n times stars

# add in reverse order from star array 0 to (n-1)/2 lines

def create_lines(n)
  upper_part = (n - 1) / 2
  empty = ' '
  starlines = []

  upper_part.times do |row|
    spaces = (n - 3 - (row * 2)) / 2
    starlines << "*#{empty * spaces}*#{empty * spaces}*"
  end

  starlines
end

def star(n)
  starlines = create_lines(n)

  starlines << '*' * n
  starlines += starlines[0...-1].reverse

  starlines.each { |line| puts line.center(n) }
end

star(7)
star(9)
