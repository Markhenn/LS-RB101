# The twentyone game from Launch School assignment

require 'pry'
require 'pry-byebug'

SUITS = {
  'H' => 'Hearts',
  'D' => 'Diamonds',
  'S' => 'Spades',
  'C' => 'Clubs'
}

VALUES = {
  'A' => 'Ace',
  'K' => 'King',
  'Q' => 'Queen',
  'J' => 'Jack',
  '10' => '10',
  '9' => '9',
  '8' => '8',
  '7' => '7',
  '6' => '6',
  '5' => '5',
  '4' => '4',
  '3' => '3',
  '2' => '2'
}

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

def shuffle(deck)
  deck.sample(deck.size)
end

def integer?(value)
  value.to_i.to_s == value
end

def deal_card!(deck)
  deck.shift
end

def display_cards(player, dealer)
  prompt "Your cards are:"
  player.each do |card| 
    prompt "#{SUITS[card[0]]} #{VALUES[card[1]]}"
  end

  prompt "The dealer has: #{SUITS[dealer[0][0]]} #{VALUES[dealer[0][1]]}"
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

def busted?(cards)
  p cards
  prompt 'busted test'
  true
end

def player_turn!(cards)
  answer = nil

  loop do
    puts "hit or stay?"
    answer = gets.chomp
    break if answer == 'stay' || busted?(cards)
    # draw a card -> mutate cards
  end

  if busted?(cards)
    # probably end the game? or ask the user to play again?
  else
    puts "You chose to stay!"
  end
  # should return the result of the hand or nil
  2
end

def dealer_turn!(cards)
  loop do
    #binding.pry
    break if total_value(cards) >= 17 || busted?(cards)
    # draw a card -> mutate cards
  end

  if busted?(cards)
    prompt 'the dealer got busted!'
    # Ask to play another game
  else
    puts "The dealer chose to stay!"
  end
  # should return the result of the hand or nil
  1
end

def determine_winner(player_result, dealer_result)
  if player_result > dealer_result
    'player'
  elsif
    'dealer wins'
  else
    'no_one'
  end
end

def display_winner(winner)
  prompt "The winner of this round of twentyone is: #{winner}"
end

basic_deck = initialize_deck
deck = shuffle(basic_deck)

p deck

player_cards = []
dealer_cards = []
player_cards << deal_card!(deck) << deal_card!(deck)
dealer_cards << deal_card!(deck) << deal_card!(deck)

display_cards(player_cards, dealer_cards)

player_result = player_turn!(player_cards)
dealer_result = dealer_turn!(dealer_cards)

winner = determine_winner(player_result, dealer_result)
display_winner(winner)

# ... continue on to Dealer turn
