# Defensive method for AI

WINNING_LINES = [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def empty_squares?(brd)
  brd.keys.select { |square| brd[square] == ' ' }
end

def pick_defense!(brd)
  square = empty_squares?(brd).sample
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count('X') == 2
      line.each { |sqr| square = sqr if brd[sqr] == ' ' }
    end
  end
  brd[square] = 'O'
end

board = {}
(1..9).each { |num| board[num] = ' ' }
board[1] = 'X'
board[2] = 'X'
board[4] = 'O'

pick_defense!(board)
p board == {1=>"X", 2=>"X", 3=>"O", 4=>"O", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
p board
