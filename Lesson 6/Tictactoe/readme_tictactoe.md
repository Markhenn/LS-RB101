# Tic Tac Toe game instructions
written by Mark Henninger based on Launch School Lesson 6

The numbers to left of each row of the board show the square numbers. This is very helpful for bigger boards. 

## how to choose board size
The constant `BOARD_WIDTH` determines the board size. 

If set to `'choose'` the player can choose at the beginning of the game the size of the board from a 3x3 board to a 7x7 board. The code would allow for bigger boards. But I feel, that playability is close to zero on boards bigger than 5x5. Also it is hard to get the whole board of 7x7 to display on a 13' screen.

`BOARD_WIDTH` can be set to an Integer instead of `'choose'`. To have a 3x3 board, `BOARD_WIDTH` should be set to 3.

## How the computer picks a square
The computer has 2 ways to pick a square. 

### The simple mode
This works by picking a square to either finish a line to win or to hinder the player from finishing a line to win. If there is no immediate chance to win or block, it chooses the spot in the middle of the board. If that one is taken, the computer picks a random square

### The minimax algorithm
The [minimax Algorithm](https://en.wikipedia.org/wiki/Minimax) calculates a tree for all possible endings the game could take. This algorithm can not be beaten by a human player. When the human player makes no mistake, every game will end in a tie. 

I had to employ both ways to pick a square because just using the minimax algorithm leads to an overflow. The minimax algorithm is a recursive algorithm. There are 9 empty squares on a 3x3 board a starting computer has to calculate !9 nodes to make a decision. This already takes a few seconds for the computer to pick a square. More empty squares lead to longer computation time and an eventual overflow. 

The constant `EMPTY_SQUARES_FOR_AI` set the threshold below which the computer moves from the simple mode to the minimax algorithm. 

## How to choose starting player
The constant `STARTING_PLAYER` determines if the player or the computer starts every turn.

If set to `'choose'` the player can choose the starting player at the beginning of the game. 

`STARTING_PLAYER` can be set manually to either `'p'` for player or `'c'` for computer.

## How to choose when the game ends
The constant `ROUNDS_TO_PLAY` determines how many rounds are played at most.

If set to `'choose'` the player can choose the amount of rounds he wants to play at the beginning of the game.

The game will end prematurely the moment one of the players has won more than half of the total rounds. If the game finishes the last round a winner is determined or a tie declared.

`ROUNDS_TO_PLAY` can be set manually to an Integer from 1 to 99. 