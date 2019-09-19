# HEY YOU!

def shout_out_to(name)
  # name = name.chars.map(&:upcase).join
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'