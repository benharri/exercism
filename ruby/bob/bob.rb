class Bob
  def self.hey(msg)
    if msg.strip == ""
      "Fine. Be that way!"
    elsif msg.chars.any?{|c| /[a-zA-Z]/.match(c)} || msg.chars.select{|c| /[a-zA-Z]/.match(c)}.all?{|c| /[A-Z]/.match(c)}
      "Whoa, chill out!"
    elsif msg.strip.end_with?("?")
      "Sure."
    else
      "Whatever."
    end
  end
end

module BookKeeping
  VERSION = 1
end
