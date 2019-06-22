# tic tac toe with unbeatable AI

# require 'pry'
# require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
STARTING_PLAYER = 'choose'
BOARD_WIDTH = 'choose'
ROUNDS_TO_PLAY = 'choose'
EMPTY_SQUARES_FOR_AI = 10

def prompt(msg)
  puts "=> #{msg}"
end

# Section: Winning Lines

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

# Section: Display the Board

def display_empty_square(brd_width)
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

def display_squares(brd_width, array, row_idx, sqr_numbers)
  line_numbers = sqr_numbers.shift(brd_width).join(", ")

  display_empty_square(brd_width)

  array.each_with_index do |square, idx|
    if idx == brd_width - 1
      print "  #{square}   \##{line_numbers}"
    else
      print "  #{square}  |"
    end
  end

  puts ""
  display_empty_square(brd_width)
  display_divider(brd_width, row_idx)
end

def display_board(brd)
  brd_width = calculate_width(brd)
  brd_values = brd.values
  sqr_numbers = brd.keys
  brd_array = []

  1.upto(brd_width) { brd_array << brd_values.shift(brd_width) }
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
  brd_array.each_with_index do |sub_ary, index|
    display_squares(brd_width, sub_ary, index, sqr_numbers)
  end
end

# Section: Game Setup

def set_board_size
  if BOARD_WIDTH == 'choose'
    loop do
      prompt "You can play tic tac toe on different board sizes from 3x3 to 7x7"
      prompt "Type 3 for 3x3 (standard tictactoe board size)"
      prompt "Type 4 for 4x4"
      prompt "Type 5 for 5x5"
      prompt "Type 6 for 6x6"
      prompt "Type 7 for 7x7"
      answer = gets.chomp
      break answer.to_i**2 if (3..7).map(&:to_s).include?(answer)
      prompt 'Not a valid choice, please type a number from 3 to 7!'
    end
  else
    BOARD_WIDTH
  end
end

def initialize_board(brd_size)
  new_board = {}
  (1..brd_size).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def determine_rounds
  if ROUNDS_TO_PLAY == 'choose'
    loop do
      puts ""
      prompt "How many rounds would you like to play?"
      prompt "Choose between 1 and 99 rounds"
      prompt "Type 1 for 1 round, 2 for 2 rounds..."
      answer = gets.chomp
      break answer.to_i if (1..99).map(&:to_s).include?(answer)

      prompt "Not a valid choice, type a number between 1 and 99!"
    end
  else
    ROUNDS_TO_PLAY
  end
end

def choose_starting_player
  if STARTING_PLAYER == 'choose'
    loop do
      puts ""
      prompt 'Who shall go first? Type p for player or c for computer?'
      answer = gets.chomp
      return answer if answer.downcase.start_with?('p', 'c')

      prompt 'Not a valid choice, type p or c!'
    end
  else
    STARTING_PLAYER
  end
end

# Section: Player Places Piece

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares?(brd))}):"
    answer = gets.chomp
    square = answer.to_i
    break  if empty_squares?(brd).map(&:to_s).include?(answer)

    prompt "Not a valid choice!"
  end
  brd[square] = PLAYER_MARKER
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

# Section: Computer Places Piece

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

def computer_places_piece!(brd)
  optimal_square = if empty_squares?(brd).size < EMPTY_SQUARES_FOR_AI
                     minimax(brd, 0, true)
                   else
                     simple_square_picker(brd)
                   end

  brd[optimal_square] = COMPUTER_MARKER
end

def deep_copy(brd)
  brd.each_with_object({}) { |(k, v), hsh| hsh[k] = v }
end

# rubocop:disable Metrics/MethodLength
def minimax(brd, depth, computer)
  if empty_squares?(brd).empty? || someone_won?(brd)
    return terminal_result(brd)
  end

  minimax_values = empty_squares?(brd).each_with_object({}) do |square, hash|
    new_brd = deep_copy(brd)

    if computer
      new_brd[square] = COMPUTER_MARKER
      hash[square] = minimax(new_brd, depth + 1, false)
    else
      new_brd[square] = PLAYER_MARKER
      hash[square] = minimax(new_brd, depth + 1, true)
    end
  end

  if depth == 0
    return optimal_square(minimax_values)
  end

  node_result(minimax_values, computer)
end
# rubocop:enable Metrics/MethodLength,

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

def terminal_result(brd)
  case detect_winner(brd)
  when 'Computer' then  1
  when 'Player'   then -1
  else 0
  end
end

# Section: Helper Functions

def empty_squares?(brd)
  brd.keys.select { |square| brd[square] == INITIAL_MARKER }
end

def calculate_width(brd)
  (brd.size**0.5).to_i
end

# Section: Determine Winner

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

def game_is_won?(winners, rounds)
  computer_wins = winners.count('Computer')
  player_wins = winners.count('Player')
  rounds_to_win = rounds[:last_round] / 2 + 1

  computer_wins == rounds_to_win || player_wins == rounds_to_win
end

def last_round_played?(rounds)
  rounds[:current_round] == rounds[:last_round]
end

def determine_game_winner(winners)
  computer_wins = winners.count('Computer')
  player_wins = winners.count('Player')

  if computer_wins > player_wins
    'The computer'
  elsif computer_wins < player_wins
    'The player'
  else
    'No one'
  end
end

def display_game_result(winners, rounds, winner)
  computer_wins = winners.count('Computer')
  player_wins = winners.count('Player')

  puts ""
  prompt "#{winner} has won after #{rounds[:current_round]} rounds. " \
    "The player won #{player_wins} and the computer won #{computer_wins} rounds"
end

# Section: Play a round

def players_move(brd, rounds, winners, current_player)
  loop do
    display_board(brd)
    display_game_stats(rounds, winners)
    place_piece!(brd, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(brd) || board_full?(brd)
  end
end

def place_piece!(brd, player)
  if player == 'p'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'p' ? 'c' : 'p'
end

def display_game_stats(rounds, winners)
  current_round = rounds[:current_round]
  final_round = rounds[:last_round]

  puts ''
  prompt "Last round was won by: #{winners.last || 'No one'}"
  prompt "#{current_round} rounds out of #{final_round} played"
  prompt "Rounds won by player: #{winners.count 'Player'}"
  prompt "Rounds won by computer: #{winners.count 'Computer'}"
  puts ''
end

# Section: Main Loop

loop do
  winners = []
  rounds = { current_round: 0, last_round: 0 }

  system 'clear'
  prompt "Welcome to a game of Tic-Tac_Toe"
  puts ""
  brd_size = set_board_size
  rounds[:last_round] = determine_rounds
  starting_player = choose_starting_player

  loop do
    brd = initialize_board(brd_size)
    current_player = starting_player
    WINNING_LINES = calculate_winning_lines(brd)

    players_move(brd, rounds, winners, current_player)

    winners << detect_winner(brd)
    rounds[:current_round] += 1

    break if game_is_won?(winners, rounds)
    break if last_round_played?(rounds)
  end

  winner = determine_game_winner(winners)
  display_game_result(winners, rounds, winner)

  puts ""
  prompt "If you want to play again type y!"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good Bye!"
