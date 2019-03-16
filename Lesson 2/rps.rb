# RPS game from Lesson 2 of Launch School RB101

RPS_CHOICES = {
  'r' => { longname: 'Rock', beats: ['s', 'l'] },
  'p' => { longname: 'Paper', beats: ['r', 'v'] },
  's' => { longname: 'Scissors', beats: ['p', 'l'] },
  'l' => { longname: 'Lizard', beats: ['v', 'p'] },
  'v' => { longname: 'Spock', beats: ['r', 's'] }
}

def prompt(message)
  puts "=> #{message}"
end

def determine_user_outcome(user_choice, comp_choice)
  if user_choice == comp_choice
    'draw'
  elsif RPS_CHOICES[user_choice][:beats].include?(comp_choice)
    'won'
  else
    'lost'
  end
end

def display_results(result, user, comp)
  prompt("Your choice is #{RPS_CHOICES[user][:longname]}")
  prompt("The computers choice is #{RPS_CHOICES[comp][:longname]}")

  if result == 'draw'
    prompt('This round is a draw!')
  else
    prompt("You #{result} the round!")
  end
  puts
end

def choose_strategy
  loop do
    prompt('Please choose one of the following moves:')
    RPS_CHOICES.each do |k, v|
      prompt("#{k} = #{v[:longname]}")
    end

    user_choice = gets.chomp[0]
    if !user_choice.nil? && RPS_CHOICES.include?(user_choice.downcase)
      return user_choice.downcase
    end

    prompt('Invalid strategy!')
  end
end

def play_a_round
  comp_choice = RPS_CHOICES.keys.sample
  user_choice = choose_strategy
  system('clear') || system('cls')

  result = determine_user_outcome(user_choice, comp_choice)
  display_results(result, user_choice, comp_choice)

  result
end

def display_standings(score)
  rounds_played = 0

  score.each do |k, v|
    rounds_played += v
    prompt("You #{k} #{v} round/s")
  end

  prompt("So far #{rounds_played} round/s have been played")
  puts
end

def game_over?(score)
  game_over = false
  score.each do |k, v|
    if k != 'draw' && v == 5
      game_over = true
      break
    end
  end
  game_over
end

def play_a_game
  score = Hash.new(0)
  loop do
    result = play_a_round
    score[result] += 1
    display_standings(score)

    return score if game_over?(score)
  end
end

def display_winner(score)
  if score['won'] == 5
    prompt('Congratulations!!! You won the game')
  else
    prompt('I\'m very sorry, but you lost the game')
  end
end

def start_game
  prompt('Welcome to Rock Paper Scissors!')
  loop do
    score = play_a_game
    display_winner(score)

    prompt("Type anything that starts with 'y' if you want to play again!")
    play_again = gets.chomp
    break unless play_again.downcase.start_with?('y')
  end
end

start_game
