# tic tac toe with unbeatable AI

require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
STARTING_PLAYER = 'player'
BOARD_SIZE = 'choose'
EMPTY_SQUARES_FOR_AI = 10

def prompt(msg)
  puts "=> #{msg}"
end

def calculate_rows(brd)
  brd_width = calculate_width(brd)
  rows = brd.keys
  winning_rows = []

  brd_width.times { winning_rows << rows.shift(brd_width) }
  winning_rows
end

def calculate_columns(brd)
  brd_width = calculate_width(brd)
  columns = Array.new(calculate_width(brd), [])

  columns.map.with_index do |_sub_ary, idx|
    (idx + 1).step(by: brd_width, to: brd.size).to_a
  end
end

def calculate_diagonals(brd)
  width = calculate_width(brd)
  size = brd.size
  diagonals = []

  diagonals << 1.step(by: width + 1, to: size).to_a
  diagonals << width.step(by: width - 1, to: size - width + 1).to_a
end

def calculate_winning_lines(brd)
  rows = calculate_rows(brd)
  columns = calculate_columns(brd)
  diagonals = calculate_diagonals(brd)

  rows + columns + diagonals
end

def display_empty_space(brd_width)
  1.upto(brd_width) do |count|
    if count != brd_width
      print "     |"
    end
  end
  puts ""
end

def display_divider(brd_width, row_idx)
  if row_idx < brd_width - 1
    1.upto(brd_width) do |count|
      if count == brd_width
        puts "-----"
      else
        print "-----+"
      end
    end
  else
    puts ""
  end
end

def display_squares(brd_width, array, row_idx)
  display_empty_space(brd_width)
  array.each_with_index do |square, idx|
    if idx == brd_width - 1
      print "  #{square}"
    else
      print "  #{square}  |"
    end
  end
  puts ""
  display_empty_space(brd_width)
  display_divider(brd_width, row_idx)
end

def display_board(brd)
  brd_width = calculate_width(brd)
  brd_values = brd.values
  brd_array = []
  1.upto(brd_width) { brd_array << brd_values.shift(brd_width) }
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
  brd_array.each_with_index do |sub_ary, index|
    display_squares(brd_width, sub_ary, index)
  end
end

def set_board_size
  if BOARD_SIZE == 'choose'
    loop do
      prompt "Choose board size: type '3' for 3x3 or '5' for 5x5"
      answer = gets.chomp.to_i
      break answer**2 if [3, 5].include?(answer)
      prompt 'Not a valid choice, please use 3 or 5!'
    end
  else
    BOARD_SIZE
  end
end

def initialize_board(brd_size)
  new_board = {}
  (1..brd_size).each { |num| new_board[num] = INITIAL_MARKER }
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

def calculate_width(brd)
  (brd.size**0.5).to_i
end

def find_at_risk_square(line, brd, marker)
  squares_at_risk = calculate_width(brd) - 1
  if brd.values_at(*line).count(marker) == squares_at_risk
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def middle_point(brd)
  brd.size / 2 + 1
end

def simple_square_picker(brd)
  square = nil
  [COMPUTER_MARKER, PLAYER_MARKER].each do |marker|
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, marker)
      break if square
    end
    break if square
  end

  middle = middle_point(brd)

  square = middle if brd[middle] == INITIAL_MARKER
  square = empty_squares?(brd).sample if !square

  square
end

def deep_copy(brd)
  brd.each_with_object({}) { |(k, v), hsh| hsh[k] = v }
end

def computer_places_piece!(brd)
  optimal_square = if empty_squares?(brd).size < EMPTY_SQUARES_FOR_AI
                     minimax(brd, 0, true)
                   else
                     simple_square_picker(brd)
                   end

  brd[optimal_square] = COMPUTER_MARKER
end

def optimal_square(brd_values)
  max_value = brd_values.values.max
  top_squares = brd_values.each_with_object([]) do |(k, v), ary|
    ary << k if v == max_value
  end
  top_squares.sample
end

def node_result(brd_values, computer)
  if computer
    brd_values.values.max
  else
    brd_values.values.min
  end
end

# rubocop:disable Metrics/MethodLength
def minimax(brd, depth, computer)
  if empty_squares?(brd).empty? || someone_won?(brd)
    return terminal_result(brd)
  end

  minmax_values = empty_squares?(brd).each_with_object({}) do |space, hash|
    new_brd = deep_copy(brd)
    if computer
      new_brd[space] = COMPUTER_MARKER
      hash[space] = minimax(new_brd, depth + 1, false)
    else
      new_brd[space] = PLAYER_MARKER
      hash[space] = minimax(new_brd, depth + 1, true)
    end
  end

  if depth == 0
    return optimal_square(minmax_values)
  end

  node_result(minmax_values, computer)
end
# rubocop:enable Metrics/MethodLength,

def terminal_result(brd)
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
  lines_to_win = calculate_width(brd)

  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == lines_to_win
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == lines_to_win
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

def choose_starting_player
  if STARTING_PLAYER == 'choose'
    loop do
      prompt 'Who shall go first? Type player or computer?'
      answer = gets.chomp
      return answer if ['player', 'computer'].include?(answer)

      prompt 'Not a valid choice!'
    end
  else
    STARTING_PLAYER
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

def display_game_stats(rounds, winners)
  puts ''
  prompt "Last round was won by: #{winners.last || 'No one'}"
  prompt "Rounds played: #{rounds}"
  prompt "Rounds won by player: #{winners.count 'Player'}"
  prompt "Rounds won by computer: #{winners.count 'Computer'}"
  puts ''
end

loop do
  winners = []
  rounds = 0

  system 'clear'
  prompt "Welcome to a game of Tic-Tac_Toe"
  puts ""
  brd_size = set_board_size
  starting_player = choose_starting_player

  loop do
    brd = initialize_board(brd_size)
    current_player = starting_player
    WINNING_LINES = calculate_winning_lines(brd)

    loop do
      display_board(brd)
      display_game_stats(rounds, winners)
      place_piece!(brd, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(brd) || board_full?(brd)
    end

    winners << detect_winner(brd)
    rounds += 1

    if winners.count('Player') == 5 || winners.count('Computer') == 5
      prompt "#{detect_winner(brd)} won 5 games! The game is over"
      break
    end
  end

  prompt "If you want to play again type y!"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good Bye!"
