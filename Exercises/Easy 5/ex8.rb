# Alphabetical Numbers

=begin
Problem:
input an array of numbers
sort these numbers alphabetically by their name

create a hash that references number and names
change the elements in the array to their corresponsing name
sort the array
change all elements back
return array

test cases:
see below

data structure:
input: array of numbers
array of strings
output array of numbers

algorithm:
ary.sort {|a, b| hash[a] <=> hash[b]}
=end

NUMBER_NAMES = {
  0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
  5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',
  10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen',
  14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen',
  18 => 'eighteen', 19 => 'nineteen'
}

def alphabetic_number_sort(num_ary)
  num_ary.sort { |a, b| NUMBER_NAMES[a] <=> NUMBER_NAMES[b] }
end

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort1(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Extra question: Array#sort_by! is unstable and mutates the array, but we just want to return an array. Enumarable#sort_by is doing exactly that
