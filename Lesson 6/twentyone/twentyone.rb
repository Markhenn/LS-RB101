# The twentyone game from Launch School assignment

require 'pry'
require 'pry-byebug'

PLAY_TO = 21
STAY_AT = 17
WINS = 5

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
  suits = SUITS.keys
  values = VALUES.keys

  suits.product(values)
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

def display_cards(cards, name)
  prompt "The #{name} cards are:"
  cards.each do |card|
    prompt "#{VALUES[card[1]]} #{SUITS[card[0]]}"
  end
end

def display_card_values(value, name)
  prompt "The total value of the #{name} cards #{value}"
end

def total_value(cards)
  values = cards.map { |card| card[1] }

  total_value = values.reduce(0) do |sum, value|
    sum + if value == 'A'
            11
          elsif value.to_i == 0
            10
          else
            value.to_i
          end
  end

  total_value -= 10 if total_value > PLAY_TO && cards.flatten.include?('A')
  total_value
end

def busted?(value)
  value > PLAY_TO
end

def player_turn!(cards, deck, value)
  puts
  prompt "Player turn starts!"
  loop do
    display_cards(cards, "player's")
    display_card_values(value, "player's")
    puts
    break if busted?(value)

    prompt "Type 'stay' to stay, type something else to hit."
    answer = gets.chomp
    break prompt "You choose to stay!" if answer == 'stay'

    cards << deal_card!(deck)
    value = total_value(cards)
  end
end

def dealer_turn!(cards, deck, value)
  puts
  prompt "The dealer's turn starts"
  loop do
    display_cards(cards, "dealer's")
    break if value >= STAY_AT || busted?(value)

    prompt "Dealer hits!"
    puts
    cards << deal_card!(deck)
    value = total_value(cards)
  end
end

def display_round_result(player_cards, dealer_cards, player_value, dealer_value)
  puts
  puts "---"
  prompt "The game is over!"
  puts
  display_cards(player_cards, "player's")
  display_card_values(player_value, "player's")
  puts
  display_cards(dealer_cards, "dealer's")
  display_card_values(dealer_value, "dealer's")
  puts "---"
  puts
end

def determine_result(player_value, dealer_value)
  if player_value > PLAY_TO
    :busted_player
  elsif dealer_value > PLAY_TO
    :busted_dealer
  elsif player_value < dealer_value
    :dealer
  elsif player_value > dealer_value
    :player
  else
    :tie
  end
end

def display_winner(result)
  case result
  when :busted_player then prompt "The player was busted, the dealer wins!"
  when :busted_dealer then prompt "The dealer was busted, the player wins!"
  when :dealer then prompt "The dealer wins!"
  when :player then prompt "The player wins!"
  when :tie then prompt "It's a tie, nobody wins!"
  end
end

def display_game_stats(results)
  rounds_played = results.values.reduce(&:+)
  puts
  puts '---'
  prompt "#{rounds_played} rounds have been played."
  prompt "The player won #{results[:player_wins]} times."
  prompt "The dealer won #{results[:dealer_wins]} times."
  puts '---'
  puts
end

def update_game_score!(result, round_results)
  if result == :player || result == :busted_dealer
    round_results[:player_wins] += 1
  elsif result == :dealer || result == :busted_player
    round_results[:dealer_wins] += 1
  else
    round_results[:tie_rounds] += 1
  end
end

def display_game_winner(results)
  if results[:player_wins] == WINS
    prompt "You won the whole game by reaching #{WINS} wins first!"
  else
    prompt "The dealer won the whole game! You lose!"
  end
end

def someone_won?(round_results)
  round_results[:player_wins] == WINS || round_results[:dealer_wins] == WINS
end

def game_end?
  puts
  prompt "If you want to play another round type 'yes'."
  answer = gets.chomp
  return false if answer.downcase.start_with?('y')
  true
end

prompt "Welcome to the twentyone game"
puts
basic_deck = initialize_deck

loop do
  round_results = { player_wins: 0, dealer_wins: 0, tie_rounds: 0 }

  loop do
    deck = shuffle(basic_deck)
    player_cards = []
    dealer_cards = []

    player_cards << deal_card!(deck) << deal_card!(deck)
    dealer_cards << deal_card!(deck) << deal_card!(deck)

    player_value = total_value(player_cards)
    dealer_value = total_value(dealer_cards)

    display_cards([dealer_cards.first], "dealer's")

    player_turn!(player_cards, deck, player_value)
    player_value = total_value(player_cards)

    unless busted?(player_value)
      dealer_turn!(dealer_cards, deck, dealer_value)
      dealer_value = total_value(dealer_cards)
    end

    display_round_result(player_cards, dealer_cards, player_value, dealer_value)

    result = determine_result(player_value, dealer_value)
    update_game_score!(result, round_results)
    display_winner(result)

    display_game_stats(round_results)

    break if someone_won?(round_results)
  end

  display_game_winner(round_results)

  break if game_end?
end

prompt "Thank you for playing twentyone!"
