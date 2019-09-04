# Merge Sort

# Problem
# Create a merge sorting algorithm
# input: array
# output: sorted array
# mutate orginal array

# How does it work:
# break array down into subarray until there is 1 item in an array
# then put array back together by sorting each subarrays

# create a recursive algorithm

# break condition: size of subarray is 0

# use merge to merge the sorted subarray together

# Data Structure / Algorithm
# Splitting array
# REPEAT
# split array in half

def merge_sort(array)
  ary_size = array.size
  return array if ary_size == 1

  ary_left = merge_sort(array[0...ary_size / 2])
  ary_right = merge_sort(array[ary_size / 2...ary_size])

  merge(ary_left, ary_right)
end

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# LS FE
# Write a non recursicve merge sort

# turn all into individual arrays

# loop
# shift two elements
# take 2 the elements and add to merge
# append the resulting array again

# break when size of array is one

def merge_sort_nr(array)
  ary = array.permutation(1).to_a

  loop do
    element1 = ary.shift
    element2 = ary.shift

    merged = merge(element1, element2)

    return array.replace(merged) if merged.size == array.size

    ary.push(merged)
  end
end

p merge_sort_nr([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort_nr([5, 3]) == [3, 5]
p merge_sort_nr([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort_nr(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort_nr([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
