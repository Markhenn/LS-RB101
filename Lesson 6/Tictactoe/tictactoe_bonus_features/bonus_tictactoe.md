Bonus Features for TicTacToe Game

# Starting Player
The `FIRST` constant can be set to 'player', 'computer' or 'choose'.
When 'choose' the player can choose who goes first

# Unbeatable AI
The AI uses a minimax algorith to decide which square to play
From the optimal squares it randomly picks one

#TODO
## bigger play area
### Problem: Size of board
let the player decide on different board_sizes for the game
input: nothing
output: the size of the board in squares as an int

When the constant is set to 'choose' 
    the player will be asked to choose a size of
        3x3
        5x5
        9x9?
otherwise the number in the constant will be used as the number of squares

### Data Structure / Algorithm
def board_size
brd_size = if constant is set to 'choose'
            loop
            put text about options to choose
                options are, 3, 5, 9 
            get the answer
            check if 3,5,9
            return answer.to_i ** 2
           else
            return constant


### Problem: Winning Lines
Redefine WINNING LINES as a function that gets called
input: the board
output: a nested array with the winning lines inside

```ruby
WINNING_LINES = [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 5, 9], [3, 5, 7]]              # diagonals
```

The winning lines have dimension size columns and rows and 2 diagonals
The rows could be defined as
```ruby
dimension = (brd.size**0.5).to_i
winning_lines = []
1.step(brd.size, dimension) do |i| # Rows
  winning_lines << [index, index + 1, index + 2]
end

1.upto(dimension) do |i| # Columns
  winning_lines << [index, index + dimension, index + dimension]
end

winning_lines << [1, brd.size / 2 + 1, brd.size] # Diagonal 1
winning_lines << [dimension, brd.size / 2 + 1, brd.size - dimension + 1] # Diagonal 2

```

### Problem: adjust board size
Redefine display board to accomodate bigger boards
input: brd
output: display of board

```ruby
def display_squares(brd, sql, sqm, sqr)
  puts "     |     |"
  puts "  #{brd[sql]}  |  #{brd[sqm]}  |  #{brd[sqr]}"
  puts "     |     |"
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
  display_squares(brd, 1, 2, 3)
  puts "-----+-----+-----"
  display_squares(brd, 4, 5, 6)
  puts "-----+-----+-----"
  display_squares(brd, 7, 8, 9)
  puts ""
end
```

- create a loop to built the board
- things that are variable with the board
    the columns  but not the width
    the rows but not the height
    where to put the square number

### Data Structure / Algorithm
the new display board

set dimension to the square root of the size of the board -> to determine size of board
set brd_values to brd.values -> just the values in an array
set brd_ary -> this will be a nested array with the size of dimension
do dimension times
    brd_array << brd_values.shift

  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
brd_array.each_with_index do -> here we call the display of each square until the board is built
    display_squares(dimension, sub_ary, index)

  puts ""

the new display_squares(dimension, array, index)
    display_empty_space(dimension)
    array.each_with_index do |square, index|
         if index == dimension - 1
            print "  #{square}\n" 
        else 
            print "  #{square}  |"
    display_empty_space(dimension)
    display_divider(dimension, index)


def display_empty_space(dimension)
    dimension times |count|
        if count == dimension
            print "\n" 
        else 
            print "     |"
    end

def display_divider(dimension, index)
        if index < dimension - 1 
        dimension times |count|
            if count == dimension
                print "-----\n" 
            else 
                print "-----+"
        end


### Problem Improve the AI to work with bigger boards
with 3x3 the compute time for the ai is noticable on the first move. With 5x5 the the game stop on the first try. 
Change the ai to the simple mode for the first moves until x fields are empty than switch to minimax

What to change?
  The old ai to work with different boards
  The computer picks square methods to make the switch between both boards

#### Redesign computer_picks_square
  Problem: 
  needs to make a switch based on empty spaces on the board
  Create a constant for the switch
  When the empty space are smaller than this switching number, the minimax algorithm will be called
  before, the simple version is called

#### Redesign simple square picker
  Update to accomodate bigger boards
    update winning lines to method call
    the middle point needs to be a method call based on board size
    return the square instead of changing it

#### Update find squares at risk
  In a 3x3 game the computer should act when there are 2 squares set by the player towards a winning line
  But in a bigger game it might useful to block earlier
  This could be optimized by an algorithm, but I would keep it simple because I dont want the computer to break down. 





## improve flow through game
- intro text - done
- let player choose game end -> refactor loop for asking to play again done
- show score at the end done
- let player choose the size done
- create a random square picker for boards that are too big
-   no optimizing until a certain smallness, before that the oldschool ai
-   smallness of less than 9 to start
- toward the end change to optimal square picking
- create a method that builts the winning lines -> put each one, row, column and diagonals in a separate method
  row: just create an array with the size and chop it into pieces defined by the width
  column: map the rows -> first of every subary in an array then the seconds...
  column: think about how to do that programmaticcaly :) DONE
- change game to let player choose from 3x3 to 9x9 DONE
- let player choose rounds as ending  DONE
- add square numbers to empty squares DONE

- refactor code 
- write read me
