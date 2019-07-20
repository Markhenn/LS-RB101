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

def value_of_cards(values)
  values.reduce(0) do |sum, value|
    sum + if value == 'A'
            11
          elsif value.to_i == 0
            10
          else
            value.to_i
          end
  end
end

def correct_value_for_aces(card_values, value)
  card_values.reduce(value) do |total_value, card_value|
    if card_value == 'A' && total_value > PLAY_TO
      total_value - 10
    else
      total_value
    end
  end
end

def total_value(cards)
  card_values = cards.map { |card| card[1] }

  value = value_of_cards(card_values)
  correct_value_for_aces(card_values, value)
end

def busted?(value)
  value > PLAY_TO
end

def player_stays?
  prompt "Type 's' to stay, type something else to hit."
  answer = gets.chomp
  true if answer.downcase.start_with?('s')
end

def player_turn!(cards, deck, value)
  puts
  prompt "Player turn starts!"
  loop do
    display_cards(cards, "player's")
    display_card_values(value, "player's")
    puts
    break if busted?(value)

    break prompt "You choose to stay!" if player_stays?

    cards << deal_card!(deck)
    value = total_value(cards)
    system('clear') || system('cls')
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

def display_round_stats(player_cards, dealer_cards, player_value, dealer_value)
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

def determine_round_result(player_value, dealer_value)
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

def display_round_winner(result)
  case result
  when :busted_player then prompt "The player was busted, the dealer wins!"
  when :busted_dealer then prompt "The dealer was busted, the player wins!"
  when :dealer then prompt "The dealer wins!"
  when :player then prompt "The player wins!"
  when :tie then prompt "It's a tie, nobody wins!"
  end
end

def calculate_rounds(results)
  results.values.reduce(&:+)
end

def display_game_stats(results)
  puts
  puts '---'
  prompt "#{calculate_rounds(results)} rounds have been played."
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
  prompt "If you want to play another round type 'y', game ends otherwise."
  answer = gets.chomp
  return false if answer.downcase.start_with?('y')
  true
end

system('clear') || system('cls')

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

    system('clear') || system('cls')

    display_round_stats(player_cards, dealer_cards, player_value, dealer_value)

    result = determine_round_result(player_value, dealer_value)
    display_round_winner(result)

    update_game_score!(result, round_results)
    display_game_stats(round_results)

    break if someone_won?(round_results)
  end

  display_game_winner(round_results)

  break if game_end?
  system('clear') || system('cls')
end

prompt "Thank you for playing twentyone!"
