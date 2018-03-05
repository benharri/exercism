class PhoneNumber
  def self.clean(num)
    n = num.scan(/\d/).join.delete_prefix('1')
    n.size == 10 && !n[3].match?(/[01]/) ? n : nil
  end
end

module BookKeeping
  VERSION = 2
end
