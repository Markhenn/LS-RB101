PEDAC for twentyone game

# High level pseudocode
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

# Initialize Deck
## Problem
How to initialize the deck?
Which data structure to use -> hash, array, nested array
There are 52 cards in 4 suits
Hash:
{
    hearts: [2, 3, 4..., j, q, k, a]
    diamonds: [2, 3, 4..., j, q, k, a]
    clubs: 
    spades: 
}

Array:
['2h', '3h', '4h'... 'as' ] -> size 52

Nested Array:
[[2, 3...], [2, 3,], ... a]]

I would decide to just have an array.

LS suggests a nested array in the form of
[['H', '2'], ['H', 'A']]

input: nothing
output: nested array

### Data Structur / Algorithm to initialize
def initialize_deck
  set array with ['H', 'D', 'C', 'S']
  set array with (2..10).to_a + ['J', 'Q', 'K', 'A']
  set deck array empty
  loop over first array
    loop over second array
      deck append [suit, value]
  return array

# Deal Cards
Each player receives two cards from the deck
Player can see his cards
Player can see one card from the dealer

1 Method to deal a card to player or dealer
1 method to display cards of player and one from dealer

## Problem: Deal cards
The two cards must be taken from the from the deck -> this means removed from the nested array
input: deck (nested array with up to 52 arrays)
output: 1 card (array)

## Data Structure / Algorithm
Shift the array and return the element


## Problem: Display cards
Display the cards that have been drawn so far for the player and the dealer
input: nested array with cards for player and dealer
output: display of cards

# Data Structure / Algorithm
PUTS player cards
PUTS dealer card


# Calculate Aces
Calculating Aces. Remember that aces can be worth either 1 or 11, depending on the context. You should not ask the user what the value of the ace is; your program should be able to figure this out automatically.

## Problem: How to calculate the aces value
there could be more than 1 ace
calculate the total with a value of the hand with aces as 1 
when the total value is <= 11 -> add 10 to total value

Input: hand
Output: total value

## Testcases:
p total_value([['H', '5'], ['H', 'A']]) == 16
p total_value([['H', '5'], ['H', 'A'], ['H', 'J']]) == 16
p total_value([['H', '5'], ['H', 'A'], ['D', 'A']]) == 17

## Data Structure / Algorithm
def total_value(cards)
  set total value zero
  cards each
    total_value += case cards[1]
                   when Integer then cards[1].to_i
                   when 'K', 'J', 'Q' then 10
                   else 1
                   end
  end
  total_value + 10 when total_value <= 11
  total_value
end

# Player Turn
## Problem: Loop for hit or stay
When thinking about how to code up the player's turn, think about a loop that keeps asking the player to either "hit" or "stay". Now, think about the breaking condition for that loop. 

Player sees his cards and can hit or stay
when stay -> break loop
when hit -> draw another card -> loop again
break also when player is busted

Launch School code
```ruby
answer = nil
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted?   # the busted? method is not shown
end

if busted?
  # probably end the game? or ask the user to play again?
else
  puts "You chose to stay!"  # if player didn't bust, must have stayed to get here
end

# ... continue on to Dealer turn
```

