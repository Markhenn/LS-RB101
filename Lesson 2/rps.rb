# RPS game from Lesson 2 of Launch School RB101

RPS_CHOICES = %w(r p s l v)
RPS_CHOICES_LONG = %w(Rock Paper Scissors Lizard Spock)

def prompt(message)
  puts "=> #{message}"
end

def determine_winner(user_choice, comp_choice)
  # There are only 3 combinations in the game that let the user win
  user_wins = %w(rs rl rv pr pv sp sl lv lp vr vs)
  play_result = user_choice + comp_choice

  if user_choice == comp_choice
    'draw'
  elsif user_wins.include?(play_result)
    'won'
  else
    'lost'
  end
end

def display_results(result, user, comp)
  prompt("Your choice is #{RPS_CHOICES_LONG[RPS_CHOICES.index(user)]}")
  prompt("The computers choice is #{RPS_CHOICES_LONG[RPS_CHOICES.index(comp)]}")

  if result == 'draw'
    prompt('This round is a draw!')
  else
    prompt("You #{result} the round!")
  end
  puts
end

def choose_strategy
  loop do
    prompt('Please choose a strategy:')
    RPS_CHOICES.each_index do |i|
      prompt("#{i + 1}. #{RPS_CHOICES[i]} = #{RPS_CHOICES_LONG[i]}")
    end

    user_choice = gets.chomp[0].downcase
    return user_choice if RPS_CHOICES.include?(user_choice)

    prompt('Invalid strategy!')
  end
end

def play_a_round
  comp_choice = RPS_CHOICES.sample
  user_choice = choose_strategy

  result = determine_winner(user_choice, comp_choice)
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
