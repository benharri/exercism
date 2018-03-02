class Prime
  attr_reader :primes

  def self.nth(n)
    raise ArgumentError.new('N must be positive') if n < 1
    primes ||= [2, 3]
    curr = primes.last
    while n > primes.length
      curr += 2
      unless primes.any? { |p| curr % p == 0 }
        # very naive and slow :(
        primes.push(curr)
      end
    end
    primes[n - 1]
  end
end


module BookKeeping
  VERSION = 1
end
