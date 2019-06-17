# AI attacking simple

def find_at_risk_square(line, board, mode)
  if board.values_at(*line).count(mode) == 2
    board.select { |k, v| line.include?(k) && v == " " }.keys.first
  end
end

board = {}
(1..9).each { |num| board[num] = ' ' }
board[1] = 'X'
board[2] = 'X'
board[4] = 'O'
board[5] = 'O'

square = find_at_risk_square([4, 5, 6], board, 'O')
board[square] = 'O'
p board == {1=>"X", 2=>"X", 3=>" ", 4=>"O", 5=>"O", 6=>"O", 7=>" ", 8=>" ", 9=>" "}
p board
