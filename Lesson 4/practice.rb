# Practice Problems: Methods and More Methods

# Turn this array into a hash where the names are the keys and
# the values are the positions in the array.

# Problem: turn an array into a hash
# Algorithm:
# Look up method in doc
# Use each with index and object and Hash
#   Hash[index] = value

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flint_hash = flintstones.each_index.each_with_object({}) do |index, hash|
  hash[flintstones[index]] = index
end

p flint_hash

# Add up all of the ages from the Munster family hash

# Problem
# input: hash
# output: integer

# Algorithm
# SET age_sum = 0
# try to use reduce on the hash

ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}

p ages.values.reduce(:+)

# In the age hash: throw out the really old people (age 100 or older).

# Problem:
# return a hash without values bigger than 100

# Algoortihm:
# call reject on the hash

p ages.keep_if { |_name, age| age < 100 }

# Pick out the minimum age from our current Munster family hash:

# Problem:
# Pickng out the minimum age from the hash -. return an int

# Algorithm
# use values and than min from array

ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}

p ages.values.min

# Find the index of the first name that starts with "Be"

# Problem:
# Input: array
# Output: int of index
# Find an item in an array and return its index

# Data Structure / Algorithm
# Use each_with index on array
#   Look at each element
#   if first two chars of element are Be
#     return the index

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.find_index { |name| name.start_with?('Be') }

# Amend this array
# so that the names are all shortened to first three characters:

# Problem:
# change each element in the array
# delete all chars but the first 3
# the array shall be mutated
# Input: array
# Output: mutated array

# Data structure / algorithm
# use map! on the array
#   return element[0, 3]

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map! { |name| name[0, 3] }

# Create a hash that expresses
# the frequency with which
# each letter occurs in this string:

# Problem:
# count letters in a string
# put count for each letter in a string
# capitalisation matters

# Data structure / algorithm
# create hash with default of 0
# call each_char on string
# add +1 count to the char in the hash

statement = "The Flintstones Rock"

letter_count = Hash.new(0)

statement.each_char { |char| letter_count[char] += 1 if char.match?(/\w/) }

p letter_count

# Problem 8
# mutating an array while looping through is a bad idea
# because it will have unexpected behaviour and usually not solve the problem.
# code 1:
# This will print the current number but delete and return the next one
# code 2:
# This will print the last number and delete and return the last one in the ary
# only 1, 2 will be printed [1, 2] is returned

# Create a titleize method like in rails

# Problem:
# Create method that capitilizes each word in a string
# input: string
# output: string mutated (seen from example)

# questions
#   What about and empty string?
#   What not string input? validate it?

# data structure / algorithm
# split string into words
# call map on array
#   capitalize each element
# join the array with ' '

def titelize(text)
  cap_text = text.split.map(&:capitalize).join(' ')
  text.clear << cap_text
end

words = "the flintstones rock"

titelize(words)

puts words
puts words == "The Flintstones Rock"

# Modify the hash

# Problem:
# Add an extra key of age group to the hash
# the value is either kid, adult, or senior
# input: hash
# output: hash
# questions:
#   what about negative ages?

# data structure / algorithm
# set hash with age group definitions
#   use age array for key and kid, adult, senior for value
# loop over hash with map!
#   add new key to subhash
#   look up the value in the agegroup hash

def age_groups(age)
  case age
  when 0..17 then 'kid'
  when 18..64 then 'adult'
  else 'senior'
  end
end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

munsters.each do |_name, details|
  age_group = age_groups(details['age'])
  details['age_group'] = age_group
end

p munsters

numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []
number = 0

until number == numbers.size
  odd_numbers << numbers[number] if number.to_i.odd?

  number += 1
end

p odd_numbers

['a', 'b', 'c'].select do |item|
  puts item
end
