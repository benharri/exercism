class Sieve
  @num

  def initialize(base)
    @num = base
  end

  def primes
    primes = (0..@num).to_a
    primes[0] = primes[1] = nil
    primes.select{|p| p && p*p < @num}.each do |p|
      (p*p).step(@num, p) {|m| primes[m] = nil}
    end
    primes.compact
  end
end

module BookKeeping
  VERSION = 1
end
