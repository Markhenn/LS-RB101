# Practice Problems: Easy 1

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# 1
# 2
# 2
# 3

=begin
Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

! means that the method will mutate the caller, so beware
! can be a negation -> turning true to false and vice versa
? means that the method will return true or false
? can be used in the ternary operator

what is != and where should you use it? -> means not equal to, use it in a comparison
put ! before something, like !user_name -> means negate the user_name. -> returns false when user_name was true
put ! after something, like words.uniq! -> mutate the words array
put ? before something -> doesnt do anything
put ? after something -> the method will return true or false
put !! before something, like !!user_name -> negate the negation -> returns true or false which ever it was without the !!

Just to clarify, if you see ! or ? at the end of the method, it's actually part of the method name, and not Ruby syntax. Therefore, you really don't know what the method is doing, even if it ends in those characters -- it depends on the method implementation. The other uses are actual Ruby syntax:

!= means "not equals"
? : is the ternary operator for if...else
!!<some object> is used to turn any object into their boolean equivalent. (Try it in irb)
!<some object> is used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.
=end

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.gsub!(/important/, 'urgent')

=begin
The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1) -> deletes at the index 1 returns '2'
numbers.delete(1) -> deletes all accurances of 1 in the array. 
=end

numbers = [1, 2, 3, 4, 5]
puts numbers.delete_at(1)
umbers = [1, 2, 3, 4, 5]
puts numbers.delete(1)

puts (10..100).cover?(42) == true

famous_words = "seven years ago..."
puts "Four score and " << famous_words
puts famous_words.insert(0, 'Four score and ')
puts famous_words.prepend("Four score and ")

p ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]].flatten

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.assoc("Barney")
