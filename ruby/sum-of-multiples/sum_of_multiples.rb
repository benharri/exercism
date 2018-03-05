class SumOfMultiples
  def initialize(*nums)
    @mults = nums
  end

  def to(max)
    (0...max).select{|c| @mults.any?{|m| c % m == 0}}.sum
  end
end

module BookKeeping
  VERSION = 2
end
