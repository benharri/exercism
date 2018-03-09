class Prime
  attr_reader :primes

  def self.nth(n)
    raise ArgumentError.new('N must be positive') if n < 1
    sieve(50 * n)[n - 1]
  end

  def self.sieve(n)
    (2..Math.sqrt(n)).each_with_object([nil, nil, *2..n]) do |p, res|
      (p*p).step(n, p) { |m| res[m] = nil }
    end.compact
  end
end


module BookKeeping
  VERSION = 1
end
