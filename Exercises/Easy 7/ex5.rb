# Staggered Caps (Part 1)

# Problem:
# Input: string
# Output: string
# new string has staggered case. First cap then lower then cap ...
# non letters just count for places

# How to do it?
#   downcase -> chars -> map with index -> join
#   map: index even? -> upcase

# Data structure / algorithm
# characters = downcase chars map with indes
#   if index even? -> upcase
#   else -> downcase
# characters.join

def staggered_case(text)
  characters = text.chars.map.with_index do |char, index|
    if index.even?
      char.upcase
    else
      char.downcase
    end
  end
  characters.join
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# LS Exploration

def staggered_case2(string, upper = true)
  result = ''
  need_upper = upper
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

puts staggered_case2('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case2('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
puts staggered_case2('I Love Launch School!', false) == 'i lOvE LaUnCh sChOoL!'
puts staggered_case2('ALL_CAPS', false) == 'aLl_cApS'
puts staggered_case2('ignore 77 the 444 numbers', false) == 'iGnOrE 77 tHe 444 nUmBeRs'
