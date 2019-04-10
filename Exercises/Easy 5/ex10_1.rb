def print_multi_lines(str)
  horizontal_rule = "+#{'-' * 78}+"
  empty_line = "|#{' ' * 78}|"

  puts horizontal_rule
  puts empty_line

  while str.length > 76
    len = str.chop[0..75]
    str = str[76..str.length]
    puts "| #{len} |"
  end

  len = 76 - str.length
  puts "| #{str}#{' ' * len} |"
  puts empty_line
  puts horizontal_rule
end

print_multi_lines("In forty years, Earth's population will reach ten billion. Can our world support that? What kind of world will it be? Those answering these questions generally fall into two deeply divided groups--Wizards and Prophets, as Charles Mann calls them in this balanced, authoritative, nonpolemical new book. The Prophets, he explains, follow William Vogt, a founding environmentalist who believed that in using more than our planet has to give, our prosperity will lead us to ruin. Cut back! was his mantra. Otherwise everyone will lose! The Wizards are the heirs of Norman Borlaug, whose research, in effect, wrangled the world in service to our species to produce modern high-yield crops that then saved millions from starvation. Innovate! was Borlaug's cry. Only in that way can everyone win! Mann delves into these diverging viewpoints to assess the four great challenges humanity faces--food, water, energy, climate change--grounding each in historical context and weighing the options for the future. With our civilization on the line, the author's insightful analysis is an essential addition to the urgent conversation about how our children will fare on an increasingly crowded Earth.")
