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

# Calculate Aces
Calculating Aces. Remember that aces can be worth either 1 or 11, depending on the context. You should not ask the user what the value of the ace is; your program should be able to figure this out automatically.

## Problem: How to calculate the aces value
there could be more than 1 ace
calculate the total with a value of the hand with aces as 1 
when the total value is <= 11 -> add 10 to total value

Input: hand
Output: total value

## Testcases:
[['H', '5'], ['H', 'A']] == 16
[['H', '5'], ['H', 'A'], ['H', 'J']] == 16
[['H', '5'], ['H', 'A'], ['D', 'A']] == 17

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
