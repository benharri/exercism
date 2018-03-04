class Complement
  PAIRS = {
    "A" => "U",
    "T" => "A",
    "C" => "G",
    "G" => "C"
  }

  def self.of_dna(dna)
    dna.each_char.reduce("") do |memo, char|
      break "" unless PAIRS.key?(char)
      memo + PAIRS[char]
    end
  end
end


module BookKeeping
  VERSION = 4
end
