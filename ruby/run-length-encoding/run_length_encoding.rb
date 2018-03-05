class RunLengthEncoding
  def self.encode(str)
    str.chars.chunk(&:itself).map{|c, a| [a.size > 1 ? a.size : nil, c]}.join
  end

  def self.decode(str)
    str.scan(/(\d*)(\D)/).reduce('') do |res, (n, chr) |
      res << (n.empty? ? chr : chr * n.to_i)
    end
  end
end

module BookKeeping
  VERSION = 3
end
