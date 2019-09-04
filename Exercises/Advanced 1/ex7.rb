# Merge Sorted Lists

# Problem
# merge sorted lists one element at a time

# input: 2 arrays
# output: 1 array sorted

# no mutation

# how to do it:
# if one array is empty add the rest of the other
# compare first elements
# write the smaller to to the new array
# compare second and first -> write the smaller to array

# Data structure / algorithm
# couter1 == ary1.size
# couter2 == ary2.size
# new_ary = []

# loop
# break new_ary += ary2[counter2..-1] if counter1 >= ary1.size
# break new_ary += ary1[counter1..-1] if counter2 >= ary2.size

def merge(ary1, ary2)
  counter1 = 0
  counter2 = 0
  new_ary = []

  loop do
    break new_ary += ary2[counter2..-1] unless counter1 < ary1.size
    break new_ary += ary1[counter1..-1] unless counter2 < ary2.size

    if ary1[counter1] <= ary2[counter2]
      new_ary.push(ary1[counter1])
      counter1 += 1
    else
      new_ary.push(ary2[counter2])
      counter2 += 1
    end
  end
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
