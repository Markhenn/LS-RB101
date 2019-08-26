# Bubble Sort

# Problem
# Sort and array (mutate) with buble sort

# input: array
# output: - nothing but mutate input array

# Algorithm from WIKI
# procedure bubbleSort( A : list of sortable items )
#     n = length(A)
#     repeat
#         newn = 0
#         for i = 1 to n-1 inclusive do
#             if A[i-1] > A[i] then
#                 swap(A[i-1], A[i])
#                 newn = i
#             end if
#         end for
#         n = newn
#     until n <= 1
# end procedure

# Swap method
# Problem
# swapping two values in an array
# delete at index i
# insert at index i-1

def bubble_sort!(array)
  n = array.size
  until n <= 1
    new_n = 0
    1.upto(n - 1) do |i|
      if array[i - 1] > array[i]
        array[i], array[i - 1] = array[i - 1], array[i]
        new_n = i
      end
    end
    n = new_n
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]
p array

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]
p array

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p array
