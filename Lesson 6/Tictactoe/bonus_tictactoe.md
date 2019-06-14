# Bonus Features for TicTacToe Game

## Improved "join"

### Problem
- Improve the prompt for possible choices to position a piece for the player
- the last item should join with an or instead of just a comma
- Write a method called joinor

Input:
- an array
- optional string sign between the joining elements
- optional word for last joined elements

Output:
- a string of the joined elements

### Test Cases
``` Ruby
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
```

### Data Structure / Algorith