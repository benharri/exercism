class Raindrops
  def self.convert(num)
    x = ""
    x += "Pling" if num % 3 == 0
    x += "Plang" if num % 5 == 0
    x += "Plong" if num % 7 == 0
    x = num unless (num % 3 == 0 or num % 5 == 0 or num % 7 == 0)
    x.to_s
  end
end

module BookKeeping
  VERSION = 3
end
