# Tip Calculator

=begin
  Problem: Take a bill amount and a tip percent and display the total and the tip
  input: float, float
  output: float, float, console print
  Test case: see below
  Data structure:
  input: float, float
  output: float, float
  Algorithm:
  GET Bill amount from user
  GET TIP percent from user
  Calculate Tip
  PRINT results
=end

def calc_tip(amount, tip)
  (amount * tip / 100).round(2)
end

def start_program
  print '==> What is the bill: '
  bill = gets.chomp.to_f
  print '==> What is the tip in percent: '
  tip_percent = gets.chomp.to_f

  tip_total = calc_tip(bill, tip_percent)

  puts "The tip is $#{format("%2.2f", tip_total)}"
  puts "The total bill is $#{format("%02.2f", tip_total + bill)}"
end

start_program

=begin
puts calc_tip(0, 1) == 0
puts calc_tip(1, 0) == 0
puts calc_tip(1, 1) == 0.01
puts calc_tip(10, 10) == 1
=end
