# RPS game from Lesson 2 of Launch School RB101

RPS_CHOICES = %w(r p s)

def prompt(message)
  puts "=> #{message}"
end

def determine_winner(user_choice, comp_choice)
  # There are only 3 combinations in the game that let the user win
  user_wins = %w(rs pr sp)
  play_result = user_choice + comp_choice

  if user_choice == comp_choice
    'draw'
  elsif user_wins.include?(play_result)
    'won'
  else
    'lost'
  end
end

def display_game_stats(result, user, comp)
  prompt("Your choice is #{user}")
  prompt("The computers choice is #{comp}")

  if result == 'draw'
    prompt('The game is a draw!')
  else
    prompt("You #{result} the game!")
  end
end

def choose_strategy
  loop do
    prompt('Please choose a strategy: r = Rock, p = Paper, s = Scissors')
    user_choice = gets.chomp[0].downcase
    return user_choice if RPS_CHOICES.include?(user_choice)
  end
end

def play_game
  comp_choice = RPS_CHOICES.sample
  user_choice = choose_strategy
  result = determine_winner(user_choice, comp_choice)
  display_game_stats(result, user_choice, comp_choice)
end

def start_game
  prompt('Welcome to Rock Paper Scissors!')
  loop do
    play_game
    prompt("Type anything that starts with 'y' if you want to play again!")
    play_again = gets.chomp
    break unless play_again.downcase.start_with?('y')
  end
end

start_game
