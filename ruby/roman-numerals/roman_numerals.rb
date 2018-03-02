class Fixnum
  ROMANS = {
    1000 => "M",
     900 => "CM",
     500 => "D",
     400 => "CD",
     100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
       9 => "IX",
       5 => "V",
       4 => "IV",
       1 => "I",
  }
  # inspired by
  # https://codereview.stackexchange.com/a/7939
  def to_roman
    n = self
    result = ""
    ROMANS.each do |v, char|
      result << char * (n / v)
      n %= v
    end
    result
  end
end

module BookKeeping
  VERSION = 2
end
