# Combining Arrays

# Problem:
# input: 2 arrays
# output: 1 array
# method that creates an array from all unique values of the two arrays

# Data structure / algorithm
# use concat on both arrays
# use uniq

def merge1(ary1, ary2)
  ary1.concat(ary2).uniq
end

def merge(ary1, ary2)
  ary1 | ary2
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
