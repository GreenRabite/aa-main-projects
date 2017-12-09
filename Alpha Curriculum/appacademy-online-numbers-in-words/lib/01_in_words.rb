ONES = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine"
}

TENS = {
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety"
}

TEENS = {
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen"
}

MAGNITUDES = {
  100 => "hundred",
  1000 => "thousand",
  1_000_000 => "million",
  1_000_000_000 => "billion",
  1_000_000_000_000 => "trillion"
}

class Fixnum
    def in_words
      if self < 10
        ONES[self]
      elsif self < 20
        TEENS[self]
      elsif self < 100
        tens_value=(self/10)*10
        ones_value=(self%10)
        if ones_value!=0
          "#{TENS[tens_value]} #{ones_value.in_words}"
        else
          "#{TENS[tens_value]}"
        end
      else
        magnitude=find_magnitude(self)
        if self%magnitude!=0
          "#{(self/magnitude).in_words} #{MAGNITUDES[magnitude]} #{(self%magnitude).in_words}"
        else
          "#{(self/magnitude).in_words} #{MAGNITUDES[magnitude]}"
        end
      end
    end

    def find_magnitude(num)
      MAGNITUDES.keys.reverse.each do |mag|
        return mag if num/mag!=0
      end
    end

end
