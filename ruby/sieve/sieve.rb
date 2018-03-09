class Sieve
  def initialize(base)
    @num = base
  end

  def primes
    (2..Math.sqrt(@num)).each_with_object([nil, nil, *2..@num]) do |p, res|
      (p*p).step(@num, p) { |m| res[m] = nil }
    end.compact
  end
end

module BookKeeping
  VERSION = 1
end



