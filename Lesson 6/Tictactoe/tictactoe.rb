# TicTacToe Game

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares?(brd)
  brd.keys.select { |square| brd[square] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares?(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares?(brd).include?(square)

    prompt "Not a valid choice!"
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board)
  if board.values_at(*line).count(PLAYER_MARKER) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd)
    break if square
  end

  square = empty_squares?(brd).sample if !square

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares?(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(ary, delimiter=', ', word='or')
  if ary.size <= 2
    return ary.join(" #{word} ")
  end

  ary.map(&:to_s).reduce do |string, element|
    string << if element == ary.last.to_s
                "#{delimiter}#{word} #{element}"
              else
                "#{delimiter}#{element}"
              end
  end
end

winners = []

loop do
  board = initialize_board

  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  winners << detect_winner(board)

  if winners.count('Player') == 5 || winners.count('Computer') == 5
    prompt "#{detect_winner(board)} won 5 games! The game is over"
    break
  end

  prompt "If you want to play again type y!"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good Bye!"
