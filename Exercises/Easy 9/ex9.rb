# Grade Book

# Problem
# input: numbers
# output: char
# take the average of the numbers
# look up the result for the grade

# Data structure / algorithm
# add 3 numbers and devide by three
# set case statement

def get_grade(grade1, grade2, grade3)
  avg_grade = (grade1 + grade2 + grade3) / 3
  case avg_grade
  when 60...70 then   'D'
  when 70...80 then   'C'
  when 80...90 then   'B'
  when 90..100 then   'A'
  when 100..   then   'A+'
  else                'F'
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
