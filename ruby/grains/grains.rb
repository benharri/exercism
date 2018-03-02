class Grains
  def self.square(n)
    raise ArgumentError if n < 1 || n > 64
    2 ** (n - 1)
  end

  def self.total
    (0...64).map{|n| 2 ** n}.inject(&:+)
  end
end

module BookKeeping
  VERSION = 1
end
