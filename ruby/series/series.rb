class Series
  def initialize(series)
    @chars = series.chars
  end

  def slices(num)
    raise ArgumentError if num > @chars.size
    @chars.each_cons(num).map(&:join)
  end
end
