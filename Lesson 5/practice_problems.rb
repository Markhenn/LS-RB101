# Practice Problems

# Practice Problem 1
# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

p arr.sort { |a, b| b.to_i <=> a.to_i }

# Practice Problem 2
# How would you order this array of hashes
# based on the year of publication of each book,
# from the earliest to the latest?

books = [
  { title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967' },
  { title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925' },
  { title: 'War and Peace', author: 'Leo Tolstoy', published: '1869' },
  { title: 'Ulysses', author: 'James Joyce', published: '1922' }
]

# Problem
# Input: hash
# Output: sorted hash by publication year

# Data structure / algorithm
# Use sort_by
#   hash[published].to_i

p books.sort_by { |hash| hash[:published] }

# Practice Problem 3
# For each of these collection objects
# demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# Problem
# Input: different collections
# Output: reference to the letter g in them

# Create the reference based on the collection. :)

p arr1[2][1][3]
p arr2[1][:third][0]
p arr3[2][:third][0][0]
p hsh1['b'][1]
p hsh2[:third].key(0)

# Practice Problem 4
# For each of these collection objects where the value 3 occurs,
# demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

p arr1[1][1] += 1
p arr2[2] += 1
p hsh1[:first][2][0] += 1
p hsh2[['a']][:a][2] += 1

# Practice Problem 5
# Given this nested Hash:
# figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

age = 0

munsters.each_value do |munster|
  age += munster['age'] if munster['gender'] == 'male'
end

p age

# Practice Problem 6
# One of the most frequently used real-world string properties is that of "string substitution",
# where we take a hard-coded string and modify it with various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, val|
  puts "#{key} is a #{val['age']}-year-old #{val['gender']}"
end

# (Name) is a (age)-year-old (male or female).

# Practice Problem 8
# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.values.flatten.each do |word|
  word.chars.each { |char| puts char if char =~ /[aeiou]/ }
end

# Practice Problem 9
# Given this data structure, return a new array of the same structure but with the sub arrays being ordered
# (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# Problem
# reorder given subarrays in descending order
# map array then reorder each subarray

p arr.map { |sub_arr| sub_arr.sort { |a, b| b <=> a } }

# Practice Problem 10
# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the original
# but where the value of each integer is incremented by 1.

array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
new_array = array.map do |hash|
  incremented_hash = {}
  hash.each do |k, v|
    incremented_hash[k] = v + 1
  end
  incremented_hash
end

p array
p new_array

# Practice Problem 11
# Given the following data structure use a combination of methods,
# including either the select or reject method,
# to return a new array identical in structure to the original
# but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# Problem
# keep the array format but return only values that are multiples of 3s
# What to return with the others?
#   Nothing
#   empty array?

new_ary = arr.map do |sub_ary|
  sub_ary.select { |num| num % 3 == 0 }
end

p new_ary

# Practice Problem 12
# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key
# is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# Problem
# make a hash out of an array with out using Array#to_h method
# use each_with_object -

hash = arr.each_with_object({}) { |sub_arr, hsh| hsh[sub_arr[0]] = sub_arr[1] }

p hash

# Practice Problem 13
# Given the following data structure,
# return a new array containing the same sub-arrays as the original
# but ordered logically by only taking into consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# The sorted array should look like this:
# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# Problem
# sort the sub arrays based on the odd numbers in them

arr_sorted = arr.sort do |a, b|
  b_odd = b.select { |num| num.odd? }
  a_odd = a.select { |num| num.odd? }
  puts "a is #{a_odd} and b is #{b_odd}"
  a_odd <=> b_odd
end

p arr_sorted

# LS Solution
arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

# Practice Problem 14
# Given this data structure write some code
# to return an array containing the colors of the fruits and the sizes of the vegetables.
# The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
# The return value should look like this:
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# Problem
# select an array from a hash
# change the values put in the array
# Use each with object -> do an if else

new_ary = hsh.values.each_with_object([]) do |produce, ary|
  if produce[:type] == 'fruit'
    ary << produce[:colors].map(&:capitalize)
  else
    ary << produce[:size].upcase
  end
end

puts new_ary == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# Practice Problem 15
# Given this data structure
# write some code to return an array
# which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# Problem
# select sub hashes were the all values are even
# return an array
# use select -> sub hashes
#   use values on sub hash
#   use all? on values
#     num.even?

new_array = arr.select do |sub_hsh|
  sub_hsh.values.flatten.all?(&:even?)
end

p new_array

=begin
Practice Problem 16
A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters.
=end 

# Problem
# Input: none
# Output: UUID string
# a method that returns a string with 5 parts, each part a hexadecimal character
#   part 1 8 characters
#   part 2-4 4 characters
#   part 5 12 characters
# hexadecimal is from 0-9 and a-f

# how to do it?
# create an array with hex digits
# create an array
# first position is a random 8 digit hexnumber
#   cycle through 8 times and pick a random value from hex array each time
# continue with the next 4 positions
# join array on '-' and return

HEX = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def uuid_generator
  seed_uuid = [[1, 2, 3, 4, 5, 6, 7, 8], [1, 2, 3, 4], [1, 2, 3, 4], [1, 2, 3, 4], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]]

  uuid = seed_uuid.map do |sub_ary|
    new_ary = sub_ary.map do
      HEX.sample
    end
    new_ary.join
  end

  uuid.join('-')
end

puts uuid_generator

# LS Solution
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end
