# Practice Problems: Easy 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.include?('Spot') == true
ages.fetch('Spot') {|el| puts "Can't find #{el} in hash"}
puts ages.has_key?('Spot') == true
puts ages.member?('Spot') == true
puts ages.key?('Spot') == true

munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.swapcase
puts munsters_description.capitalize
puts munsters_description.downcase
puts munsters_description.upcase

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
p ages.merge(additional_ages)

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.include?('Dino') == true
puts advice.match?('Dino') == true

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
puts flintstones == %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << 'Dino'
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << 'Dino' << 'Hoppy'
p flintstones
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(%w(Dino Hoppy))
p flintstones

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice!(/house.*/)
puts advice

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice!(0, advice.index('house'))
puts advice

statement = "The Flintstones Rock!"
puts statement.count('t')

title = "Flintstone Family Members"
puts title.center(40)