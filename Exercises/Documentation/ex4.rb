# The Array#bsearch method is used to search ordered Arrays more quickly than #find and #select can. Assume you have the following code: How would you search this Array to find the first element whose value exceeds 8?

=begin
  Problem: use the method Array#bsearch  to find the value in the array
  Test case: see below
  Data structure: array, number
  Algorithm: look up documentation then see below
=end

a = [1, 4, 8, 11, 15, 19]

puts  a.bsearch {|x| x > 8}

