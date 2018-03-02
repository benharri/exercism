class Pangram
  def self.pangram?(s)
    s.downcase.chars.uniq.select{|c| c =~ /[a-z]/}.length == 26
  end
end


module BookKeeping
  VERSION = 6
end
