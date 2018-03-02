class Complement

  def self.of_dna(dna)
    pairs = {
      "A" => "U",
      "T" => "A",
      "C" => "G",
      "G" => "C"
    }
    dna.each_char.reduce("") do |memo, char|
      return "" unless pairs.member?(char)
      memo + pairs[char]
    end
  end
end


module BookKeeping
  VERSION = 4
end
