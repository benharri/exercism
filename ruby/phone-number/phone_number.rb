class PhoneNumber
  def self.clean(num)
    cl = num.scan(/\d/).join
    invalid?(num) ? nil : cl
  end

  def self.invalid?(num)
    if num.start_with?("1")
      num.size == 11
    end
  end
end

module BookKeeping
  VERSION = 2
end
