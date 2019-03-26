# Calculate room size

=begin
  Problem: calculate the the room size in square m and feet
  input: float, float
  output: float
  Test case: see below
  Data structure:
  input: float, float
  output: float
  Algorithm:
  GET length from user
  GET width from user
  calculate square meter
  calculate square feet
  show to user
=end

SQMETERS_TO_SQFEET = 10.7639

def calculate_room_sqm(length, width)
  (length * width).round(2)
end

def translate_to_sqf(sqm)
  (sqm * SQMETERS_TO_SQFEET).round(2)
end

def start_program
  puts '==> Please enter the width of the room in meters'
  width = gets.chomp.to_f
  puts '==> Please enter the length of the room in meters'
  length = gets.chomp.to_f

  sqm = calculate_room_sqm(width, length)
  sqf = translate_to_sqf(sqm)

  puts "The area of the room is #{sqm} square meters (#{sqf} square feet)."
end

start_program


=begin
puts calculate_room_sqm(5, 10) == 50
puts calculate_room_sqm(0, 10) == 0
puts calculate_room_sqm(5, 0) == 0
puts translate_to_sqf(1) == 10.7639
puts translate_to_sqf(0) == 0
puts translate_to_sqf(10) == 107.639
=end
