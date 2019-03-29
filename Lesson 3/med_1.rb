# Practice Problems: Medium 1

10.times { |x| puts "#{' ' * x}The Flintstones Rock!" }

# puts "the value of 40 + 2 is " + (40 + 2)
# The first part is a string and after the string comes an int. This implicit conversion is not allowed

puts "the value of 40 + 2 is #{40 + 2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s

def factors(number)
  divisor = number
  factors = []
  begin
    break if number <= 0

    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

# Bonus 1: number % divisor == 0 checks if there would be a left over after the division, only when there is no left over it is a factor
# Bonus 2: This returns the value of factors at the end of the method. Without it, the return value of the loop would be returned, which is nil here

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Yes there is a big difference. Version 1 (<<) mutates the array buffer outside of the method as well. Which means the original buffer array is changed. In version 2 (+) the method doesnt mutate the original buffer array, it only returns a new array. 

LIMIT = 15

def fib(first_num, second_num)
  while first_num + second_num < LIMIT
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# The method doenst know the limit variable, because it is not in scope. Make limit a constant to solve the problem.

def tricky_method(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# First change += to << then rename the method to update_string_and_array!. Even better we could make two methods and call one update_string! and one update_method!

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

# Yes it changes the munsters hash, because demo_hash points to the same memory spot that the munsters point to. Through the each method, the object_ids from the original munsters hash are taken the memory they point to changed. Which changes the original hash. 

p munsters

#Q9: Paper
#10: no