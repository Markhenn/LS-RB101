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
def count_occurrences(array)
  occurrences = {}

  array.map(&:downcase).each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end


count_occurrences(vehicles)