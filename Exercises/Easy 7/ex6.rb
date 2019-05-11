# Staggered Caps (Part 2)

def staggered_case(string, upper = true)
  result = ''
  need_upper = upper
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end

    need_upper = !need_upper if char =~ /[a-z]/i
  end
  result
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# LS exploration

def staggered_case2(string, non_digits_count = true)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i || !non_digits_count
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end

puts staggered_case2('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case2('ALL CAPS') == 'AlL cApS'
puts staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
puts staggered_case2('I Love Launch School!', false) == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case2('ALL CAPS', false) == 'AlL CaPs'
puts staggered_case2('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 NuMbErS'
