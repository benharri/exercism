class Complement
  PAIRS = {
    "A" => "U",
    "T" => "A",
    "C" => "G",
    "G" => "C"
  }

  def self.of_dna(dna)
    dna.each_char.reduce("") do |memo, char|
      memo << (PAIRS[char] or break "")
    end
  end
end


module BookKeeping
  VERSION = 4
end
