require 'pry'
require 'pry-byebug'

def joinor(ary, delimiter=', ', word='or')
  if ary.size <= 2
    return ary.join(" #{word} ")
  end

  ary.map(&:to_s).reduce do |string, element|
    if element == ary.last.to_s
      string << "#{delimiter}#{word} #{element}"
    else
      string << "#{delimiter}#{element}"
    end
  end
end

p joinor([1]) == "1"
p joinor([1, 2]) == "1 or 2"
p joinor([1, 2, 3]) == "1, 2, or 3"
p joinor([1, 2, 3], '; ') == "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"
p joinor([1, 2, 3], '; ', 'and') == "1; 2; and 3"