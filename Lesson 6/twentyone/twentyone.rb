# The twentyone game from Launch School assignment

require 'pry'
require 'pry-byebug'

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  suits = ['H', 'D', 'C', 'S']
  values = (2..10).map(&:to_s) + ['J', 'Q', 'K', 'A']
  suits.each_with_object([]) do |suit, deck|
    values.each do |value|
      deck << [suit, value]
    end
  end
end

def integer?(value)
  value.to_i.to_s == value
end

def total_value(cards)
  values = cards.map { |card| card[1] }

  total_value = values.reduce(0) do |sum, value|
    sum + if value == 'A'
            1
          elsif value.to_i == 0
            10
          else
            value.to_i
          end
  end

  total_value += 10 unless total_value > 11
  total_value
end

deck = initialize_deck

p total_value([['H', '5'], ['H', 'A']]) == 16
p total_value([['H', '5'], ['H', 'A'], ['H', 'J']]) == 16
p total_value([['H', '5'], ['H', 'A'], ['D', 'A']]) == 17
