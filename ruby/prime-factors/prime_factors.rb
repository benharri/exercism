class PrimeFactors
  def self.for(i)
    r = []
    d = 2
    while i > 1
      if i % d == 0
        i /= d
        r << d
      else
        d += 1
      end
    end
    r
  end
end
