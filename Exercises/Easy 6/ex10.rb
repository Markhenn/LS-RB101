# Right Triangles

# Problem:
# Input: number
# Output: print to console
# method that takes a number and prints a triangle of stars
# The triangle is right aligned

# The first line has number - 1 empty spaces + 1 star
# The last line has number stars

# number - counter of ' ' and counter *

# Data structure / algorithm
# number.times |counter|
#   puts number - counter ' ' + counter *

def triangle_right(height)
  (height + 1).times { |counter| puts ' ' * (height - counter) + '*' * counter }
end

def triangle_left(height)
  (height + 1).times { |counter| puts '*' * counter +   ' ' * (height - counter) }
end

def triangle_head(height)
  (height).times { |counter| puts '*' * (height - counter) +   ' ' * counter }
end



triangle_head(5)
triangle_head(9)
