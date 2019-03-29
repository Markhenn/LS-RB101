# ractice Problems: Hard 1

if false
  greeting = “hello world”
end

greeting

# greeting is nil - because it gets initialized in the block, but because the block doesnt execute, the value of greeting is nil.

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # {a: "hi there"}