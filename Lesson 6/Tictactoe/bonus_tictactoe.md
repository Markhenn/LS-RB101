Bonus Features for TicTacToe Game

# Improved "join"

## Problem
- Improve the prompt for possible choices to position a piece for the player
- the last item should join with an or instead of just a comma
- Write a method called joinor

Input:
- an array
- optional string sign between the joining elements
- optional word for last joined elements

Output:
- a string of the joined elements

## Test Cases
``` Ruby
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
```

## Data Structure / Algorithm
1. if array length is <= 2
    - return join array on ', '
2. call reduce on array 
3.  if element is last element in array
    - append join sign, space, word, space, element
4.  else
    - append sign, space, element


# Keep Score
## Problem
Keep track of scores
first to 5 wins
no no global variables or constants

## Data Structure / Algorithm
create a winners array outside all loops
add the winner to the array (or tie) every round
break the outer loop if someone has won 5 times 
display a message for the total winner

# Computer AI: Defense
## Problem
Create a computer that counters when the player has 2 squares in a row
if no threat pick random square

modify computer_places_piece! method
input: the board (hash keys are numbers and values are the markers)
output: nothing -> but modifies the board in a key to become the computer marker

## Test Cases
``` Ruby
board = {}
(1..9).each { |num| board[num] = ' ' }
board[1] = 'X'
board[2] = 'X'
board[4] = 'O'

pick_defense!(board)
board == {1=>"X", 2=>"X", 3=>"O", 4=>"O", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
```

## Data Structure / Algorithm
set square randomly
Use the winning lines to determine where to set the last piece
call each on winning lines
    if a line contains 2 player markers
        set that line for square
return square