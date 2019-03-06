# What do each of these puts statements output?

=begin
  Problem: analyse behauviour of method  Array#fetch
  Test case: see below
  Data structure: array, number, string
  Algorithm: look up documentation then see below
=end

a = %w(a b c d e)
p a[7]
#puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }

# Index Error because there is no index 7 in a
# 'beats me' - no index 7, but a default return is given
# 49 - index 7 does not exist, so the block is executed
