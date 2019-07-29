# 1000 lights

# Problem:
# Have a method to calculate which switches are on, given a pass through algo
# input: number
# output: array
# start with an array of n size times false
# The algorithm goes through the array n = size of array times
#   on every pass it toggles certain switches (bools)
#   first pass -< turn all on
#   second pass -> multiples of 2
#   third pass -> multiples of 3
#   fourth pass -> multiples of 4
#   n pass -> multiples of n

# Example
# The result is that 2 lights are left on, lights 1 and 4.
# The return value is [1, 4].
# With 10 lights, 3 lights are left on: lights 1, 4, and 9.
# The return value is [1, 4, 9].

# Data structure / Algorithm
# create n size array with false in it
# repeat n times
#   map! array (try each as well)
#     each position multiple of n is flipped (!)
#     else -> stays the same

# Once over return array each with object with index
#   ary << index if element -> only triggers on true

# Problem
# Display the switches that are on
#   "lights 2, 3, and 5 are now off; 1 and 4 are on."
# input: switches
# output: display

# Data Structure / Algorithm
# set lights_on to a function that calculates the lights on
# set lights_off to another function
# display switches by calling joinor on both variables

# Problem
# return which lights are on / off
# input: array, bool
# output: array

# Data Structure / Algorithm
# SET array toggled_one_way
# call each with index on array input
#   if element == bool input
#     push index to toggled_one_way
# return toggled_one_way

# Problem
# Joing the array to string in the form of: 2, 3, and 5
# input: array
# output: string

# Data Structure / Algorithm
# if array is less than 2 size
#   return array.join(' and ')

# array.map(&:to_s).reduce
#   if element is the last element
#     string + ' and ' + element
#   else
#     string + ', ' + element

def toggle_switches(switches, number_switches)
  toggled = switches
  1.upto(number_switches) do |n|
    toggled.map!.with_index do |switch, idx|
      if (idx + 1) % n == 0
        !switch
      else
        switch
      end
    end
    if n == 1
      puts 'All lights are on!'
    else
      display_switches(toggled)
    end
  end
  toggled
end

def turned_on(switches)
  switches.each_with_object([]).with_index do |(switch, ary), idx|
    ary << idx + 1 if switch
  end
end

def determine_switches(switches, on_off)
  toggled_one_way = []
  switches.each_with_index do |switch, idx|
    if switch == on_off
      toggled_one_way << idx + 1
    end
  end
  toggled_one_way
end

def joinor(switches_idx)
  if switches_idx.size <= 2
    return switches_idx.join(' and ')
  end

  switches_idx.map(&:to_s).reduce do |string, idx|
    string << if idx == switches_idx[-1].to_s
                " and #{idx}"
              else
                ", #{idx}"
              end
  end
end

def display_switches(switches)
  swit_on = determine_switches(switches, true)
  swit_off = determine_switches(switches, false)

  puts "Lights #{joinor(swit_off)} are now off; #{joinor(swit_on)} are on."
end

def switches_turned_on(number_switches)
  switches = Array.new(number_switches, false)

  switches = toggle_switches(switches, number_switches)

  turned_on(switches)
end

p switches_turned_on(5) == [1, 4]
p switches_turned_on(10) == [1, 4, 9]
# p switches_turned_on(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
