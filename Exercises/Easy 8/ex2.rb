# Madlibs

# Problem
# create a madlibs program
# the user enters a noun, verb, adjective, adverb
# Those are entered into a string which is displayed
# Validation of input?
# What to do with wrong input?

# Example
# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!

# Data structure / algorithm
# SET madlibs array
# add userinputs to array
# string iterpolation with words from array

madlibs = []

print "Enter a noun: "
madlibs << gets.chomp
print "Enter a verb: "
madlibs << gets.chomp
print "Enter an adjective: "
madlibs << gets.chomp
print "Enter an adverb: "
madlibs << gets.chomp

puts "Do you #{madlibs[1]} your #{madlibs[2]} #{madlibs[0]} #{madlibs[3]}? That's hilarious!"
