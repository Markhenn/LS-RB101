# Tri-Angles

# Problem
# Check if a triangle is true based on angles
# Input: 3 ints for angles
# output: symbol based on result

# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.

# all angles bigger than zero
# sum of angles is 180

# check if triangle is invalid
# check if one angle is 90 degrees
# check if one is great than 90 degree

# Data structure / Algorithm
# put angles in array
# get max angle in array
# check if angles include 0 || reduce(:+) != 180 -> invalid
# when any angle == 90 -> right
# when any > 90 -> obtuse
# else acute

def triangle(ang1, ang2, ang3)
  angles = [ang1, ang2, ang3]
  max_angle = angles.max

  case
  when angles.include?(0), angles.reduce(:+) != 180
    :invalid
  when max_angle == 90
    :right
  when max_angle > 90
    :obtuse
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
