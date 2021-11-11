class Bob
  def self.hey(s)
    if s.blank?
      "Fine. Be that way!"
    elsif s.each_char.any?(&.ascii_letter?) && s.each_char.none?(&.lowercase?)
      return "Calm down, I know what I'm doing!" if s.ends_with?('?')
      "Whoa, chill out!"
    elsif s.ends_with?('?')
      "Sure."
    else
      "Whatever."
    end
  end
end

