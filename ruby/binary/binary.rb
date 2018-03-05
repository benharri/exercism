class Binary
  def self.to_decimal(num)
    raise ArgumentError unless num.chars.all?{|c| /[01]/.match(c)}
    num.chars.reverse.each_with_index.reduce(0) do |acc, (elem, i)|
      acc += elem.to_i * 2 ** i
    end
  end
end

module BookKeeping
  VERSION = 3
end
