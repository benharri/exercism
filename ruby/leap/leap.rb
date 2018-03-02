class Year
  def self.leap?(yr)
    yr % 400 == 0 || (yr % 4 == 0 && yr % 100 != 0)
  end
end

module BookKeeping
  VERSION = 3
end
