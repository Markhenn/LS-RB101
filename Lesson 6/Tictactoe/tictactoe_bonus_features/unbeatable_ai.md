Create an unbeatable AI for tictactoe with minmax

# Basic idea of minmax
- recursive algorithm
- on each step maximizes for the player or minimizes for the opponent
- builts a tree with nodes to the end of the game
    - then evaluates all the nodes up to the start

# What I need for minmax to work
## minmax function
When there are no moves left to take 
    return the gameresult for the brd

When it is the computers turn
    set values array
    for each empty board space
        mark each space with an O on brd
        call minmax with that new brd and computer false and append to values
    return the highest value from values array
else (player turn)
    set values array
    for each empty board space
        mark each space with an X on brd
        call minmax with that new brd and computer true and append to values
    return the lowest value from values array

``` ruby
def minimax(brd, computer)
    new_brd = brd.each_with_object({}) { |(k, v), hsh| hsh[k] = v }
    if empty_spaces?(new_brd).empty? || someone_won?(new_brd)
        return game_result(brd) # needs to be defined
    
    if computer
        values = []
        empty_spaces?(new_brd).each do |space|
            new_brd[space] = 'O'
            values << minimax(new_brd, false)
        end
        return values.max
    else
        values = []
        empty_spaces?(new_brd).each do |space|
            new_brd[space] = 'X'
            values << minimax(new_brd, true)
        end
        return values.min
    end
end


brd_values = empty_spaces?(brd).each_with_object({}) do |square, hash|
    hash[square] = minimax(brd, false)
end    

optimal_space = [brd_values.max_by {|k, v| v}].t_h
brd[optimal_space] = 'O'

```

## a function that determines the result and gives +1, -1, 0 for win, lose or tie
``` ruby
def game_result(brd)
    score = if determine_winner(brd) == 'Computer'
                1
            elsif determine_winner(brd) == 'Player'
                -1
            else
                0
            end
end
```


# Test Case
     |     |
  O  |  X  |
     |     |
-----+-----+-----
     |     |
  X  |  X  |  O
     |     |
-----+-----+-----
     |     |
     |  O  |
     |     |

Computer should play 9 to win
Everything else would end in draw
That means the return should be {3=>0, 7=>0, 9=>1}

It is the computes turn so at the end should be 2 more O's

tree
-> computer 3 7 9
for 3 -> human 7 9 -> for 7 -> comp 9 -> result 1
for 3 -> 

see tree in notability