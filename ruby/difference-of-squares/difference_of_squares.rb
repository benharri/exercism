class Squares
  @num
  def initialize(num)
    @num = num
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def sum_of_squares
    (1..@num).map{|n| n ** 2}.inject(&:+)
  end

  def square_of_sum
    (1..@num).inject(&:+) ** 2
  end

end

module BookKeeping
  VERSION = 4
end
