# Test for unbeatable

# TicTacToe Game with unbeatable AI

require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST = 'player'

WINNING_LINES = [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

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

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece_old!(brd)
  square = nil
  [COMPUTER_MARKER, PLAYER_MARKER].each do |marker|
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, marker)
      break if square
    end
    break if square
  end

  square = 5 if brd[5] == INITIAL_MARKER
  square = empty_squares?(brd).sample if !square

  brd[square] = COMPUTER_MARKER
end

def deep_copy(brd)
  brd.each_with_object({}) { |(k, v), hsh| hsh[k] = v }
end

def computer_places_piece!(brd)
  brd_values = empty_squares?(brd).each_with_object({}) do |square, hash|
    new_brd = deep_copy(brd)
    new_brd[square] = COMPUTER_MARKER
    hash[square] = minimax(new_brd, 0, false)
  end

  optimal_square = brd_values.max_by { |_k, v| v }
  brd[optimal_square.first] = COMPUTER_MARKER
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def minimax(brd, depth, computer)
  if empty_squares?(brd).empty? || someone_won?(brd)
    return game_result(brd)
  end

  if computer
    values = []
    empty_squares?(brd).each do |space|
      new_brd = deep_copy(brd)
      new_brd[space] = COMPUTER_MARKER
      values << minimax(new_brd, depth + 1, false)
    end
    values.max
  else
    values = []
    empty_squares?(brd).each do |space|
      new_brd = deep_copy(brd)
      new_brd[space] = PLAYER_MARKER
      values << minimax(new_brd, depth + 1, true)
    end
    values.min
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def game_result(brd)
  if detect_winner(brd) == 'Computer'
    1
  elsif detect_winner(brd) == 'Player'
    -1
  else
    0
  end
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

def choose_first_player
  loop do
    prompt 'Who shall go first? Type player or computer?'
    answer = gets.chomp
    return answer if ['player', 'computer'].include?(answer)

    prompt 'Not a valid choice!'
  end
end

def place_piece!(brd, player)
  if player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

winners = []

loop do
  board = initialize_board

  current_player = if FIRST == 'choose'
                     choose_first_player
                   else
                     FIRST
                   end

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
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
