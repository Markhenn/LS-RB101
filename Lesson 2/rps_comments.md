# Comments and PEDA for the Rock Paper Scissors game

## Requirements

- the user makes a choice
- the computer makes a choice
- the winner is displayed

## PEDA

### Problem
Program a game that lets the user play rock paper scissors
input: User picks a strategy
output: User wins, draws, or loses against computer

### Examples / Tests
User: rock Comp: rock => draw
User: paper Comp: rock => win
User: scissors Comp: rock => lose
User: rock Comp: paper => lose
User: paper Comp: paper => draw
User: scissors Comp: paper => win
User: rock Comp: scissors => win
User: paper Comp: scissors => lose
User: scissors Comp: scissors => draw

=begin
puts determine_winner('r', 'r') == 'draw'
puts determine_winner('p', 'r') == 'win'
puts determine_winner('s', 'r') == 'lose'
puts determine_winner('r', 'p') == 'lose'
puts determine_winner('p', 'p') == 'draw'
puts determine_winner('s', 'p') == 'win'
puts determine_winner('r', 's') == 'win'
puts determine_winner('p', 's') == 'lose'
puts determine_winner('s', 's') == 'draw'
=end

### Data Structures
input: string (rock, paper, scissor)
ouput: string (win, draw lose)

### Algorithm
Display Welcome
User picks strategy
    can use just r,s,p or full word
    validates against array [r,s,p]
    SET user_choice
SET comp_choice randomly from [r,s,p]
Determine the result
    compare both choices
    return win, lose or draw
Display result 
Ask for another round


