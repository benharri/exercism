class Phrase
  @phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.scan(/\b[\w']+\b/).map(&:chomp).map(&:downcase)
    m = Hash.new
    words.uniq.each {|word| m[word] = words.count(word)}
    m
  end
end

module BookKeeping
  VERSION = 1
end
