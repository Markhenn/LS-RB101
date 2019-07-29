# Diamonds!

# Problem
# Write method that displays a 4 pointed diamond
# n is the number of starss and columns
#   n is always an odd int

# How to solve this
#   There is empty space left of the stars printed
#   the stars + empty space equal n
#   stars are equal to the stars number
#     until half + 1, then they go lower again
#     until 1 star on stars n

#   use a loop for the starss -> n times
#     use a loop for the columns -> n + space / 2
#       print spaces for (n - stars) / 2
#       print stars for stars

#   create a method that returns stars as a string based on the stars number and n
#   save the result to an array
#   repeat that until you reach the half point
#     reverse the array and delete the first one
#     append this to the original array
#   print the array

# Test cases / examples
# see below

# Data structure / Algorithm
# SET diamond array
# array = 1 upto n + 1 / 2 then map
#   empty space * (n-stars)/2 + star * stars

# array + array[0..-2].reverse
# array.each -> puts every element

def print_diamond(half_diamond, grid_size)
  half_diamond += half_diamond[0..-2].reverse

  half_diamond.each { |stars| puts stars.center(grid_size) }
end

def diamond_outline(grid_size)
  half_diamond = ['*']
  (1..grid_size - 2).step(2).each do |n|
    spaces = ' ' * n
    half_diamond << "*#{spaces}*"
  end

  print_diamond(half_diamond, grid_size)
end

def diamond(grid_size)
  half_diamond = (1..grid_size).step(2).map do |stars|
    '*' * stars
  end

  print_diamond(half_diamond, grid_size)
end

diamond(1)
diamond(3)
diamond(9)

diamond_outline(1)
diamond_outline(3)
diamond_outline(5)
diamond_outline(9)
