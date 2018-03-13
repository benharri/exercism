module Hamming
  def self.compute(a, b)
    raise ArgumentError unless a.size == b.size
    (0..a.size).count {|i| a[i] != b[i]}
  end
end

