# Bonus features for twentyone

1. store the total value as a local variable - done
2. create a loop to play to 5 and keep score
3. make the game bust point and stay point for AI variable. ie 31 and 27 - done

## Problem store as local variable
Instead of recalculating the total value, we store it a local variable in the main loop
This value is passed around and updated when needed

### Where to update?
- After the starting cards are dealt
- After each round of the player and dealer turn
    - must then be returned from the turn to update the value in the main loop

### Where to pass in?
- detect_result
- determine_winner
- busted?
- gamestats

## create a loop to play to 5
### Problem
The game should go until dealer or player has 5 wins
    The game can break once a player has 5 wins

#### What to change
- create a loop for each round -> done
- break method to check if -> done
    someone won
- display the winner once the game is over
- display at the end of the round the current stats
- keeping track of the wins and ties ->

### Problem loop and break method
start a new game round until someone won or 5 rounds are over

#### Data Structure / Algorithm
Set wins array
loop 
    play a round
    check if someone won
end

#### Problem how to check if someone won?
player or dealer will win after 5 won rounds

The array will contain, p, d and tie
count how many times each is in the array



## make the endpoint of the game constants
- Done