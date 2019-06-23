# The twentyone game from Launch School assignment

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  set array with ['H', 'D', 'C', 'S']
  set array with (2..10).to_a + ['J', 'Q', 'K', 'A']
  set deck array empty
  loop over first array
    loop over second array
      deck append [suit, value]
  return array

def initialize_deck
  suits = ['H', 'D', 'C', 'S']
  values = (2..10).to_a + ['J', 'Q', 'K', 'A']
  p values
end

initialize_deck
