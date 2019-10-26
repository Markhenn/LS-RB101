# Write a method that counts the number of occurrences of each element in a given array.

# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted, print each element alongside the number of occurrences.

=begin
  Problem: 
  input: array with repeating elements
  output: list in console with how many times each element has been found
  important case sensitive
  Test case: see below
  Data structure: array, hash, number, 
  Algorithm: 
  loop over array
    add element as key to hash with value +1
  loop over hash to print key value pairs
=end

=begin
def count_occurrences list
  list_hash = Hash.new(0)
  list.each do |item|
    list_hash[item.downcase] += 1
  end

  list_hash.each {|k,v| puts "#{k} => #{v}"}

end
=end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv', 'truck'
]



=begin
car => 4
truck => 3
SUV => 1
motorcycle => 2
=end



# LS Solution:
def count_occurrences1(array)
  occurrences = {}

  array.map(&:downcase).each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

def count_occurrences(vehicles)
  cars = vehicles.map(&:downcase)
  cars.uniq.each do |car|
    car_count = cars.count(car)
    puts "#{car} => #{car_count}"
  end
end

count_occurrences(vehicles)

# From `line 47` to `line 57` we define a method called `count_occurences` with a parameter called `array`
# we initialize the local variable `occurences` and assign it an empty hash object
# On `line 50` we call the Array#map method on the local variable `array` and pass in the String#downcase method as proc and.
# On the return value the Array#each method is called passing in a `do..end` block as an argument with one  parameter
# in the local Hash Object `occurence` we assign the key with the value of the String object `element` the return value of calling the Array#count method on the local variable array with the value of the local variable `element` as an arguement. 
#
# on `line 54` we call the Array#each method on the local variable `occurences` passing in a `do..end` block ranging from `line 54` to `line 57` with two parameters called `element` and `count`
# the call the Kernerl#puts method  with a string object interpolating the values of `element` and `count`
#
# on `line 59` we invoke the method `count_occurences` with the array value of the local variable `vehicles`
#
# the method displays each unique vehicle in the array and the count of how many times the vehicle is found in the array. The case of the word is ignored (Car counts as car)
# return value is the hash with vehicle names as keys and count as values