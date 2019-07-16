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

def display_cards(cards)
  cards.each do |card|
    prompt "#{VALUES[card[1]]} #{SUITS[card[0]]}"
  end
end

def display_game_stats(player, dealer)
  prompt "Your cards are:"
  display_cards(player)

  prompt "The dealer has:"
  display_cards(dealer)
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

  total_value += 10 if total_value <= 11 && cards.flatten.include?('A')
  total_value
end

def busted?(cards)
  total_value(cards) > 21
end

def player_turn!(cards, deck)
  prompt "Player turn starts!"
  loop do
    display_cards(cards)
    break if busted?(cards)

    prompt "Type 'stay' to stay, type something else to hit."
    answer = gets.chomp
    if answer == 'stay'
      prompt "You choose to stay!"
      break
    end

    cards << deal_card!(deck)
  end
end

def dealer_turn!(cards, deck)
  loop do
    display_cards(cards)
    break if total_value(cards) >= 17 || busted?(cards)

    cards << deal_card!(deck)
  end
end

def determine_winner(player_cards, dealer_cards)
  p_result = total_value(player_cards)
  d_result = total_value(dealer_cards)

  if busted?(player_cards) || !busted?(dealer_cards) && p_result < d_result
    'dealer'
  elsif busted?(dealer_cards) || p_result > d_result
    'player'
  else
    'no_one'
  end
end

def display_winner(winner)
  prompt "The winner of this round of twentyone is: #{winner}"
end

prompt "Welcome to the twentyone game"
basic_deck = initialize_deck
player_cards = []
dealer_cards = []

loop do
  deck = shuffle(basic_deck)

  player_cards << deal_card!(deck) << deal_card!(deck)
  dealer_cards << deal_card!(deck) << deal_card!(deck)

  first_dealer_card = [dealer_cards.first]

  display_game_stats(player_cards, first_dealer_card)

  player_turn!(player_cards, deck)
  prompt "The total value of the player cards #{total_value(player_cards)}"
  break prompt "player was busted!" if busted?(player_cards)

  dealer_turn!(dealer_cards, deck)
  prompt "The total value of the dealer cards #{total_value(dealer_cards)}"
  break prompt "dealer was busted!" if busted?(dealer_cards)

  puts

  display_game_stats(player_cards, dealer_cards)
  break
end

winner = determine_winner(player_cards, dealer_cards)
display_winner(winner)
