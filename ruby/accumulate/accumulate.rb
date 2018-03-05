class Array
  def accumulate(&block)
    if block_given?
      each_with_object([]) {|elem, out| out << yield(elem)}
    else
      self.to_enum
    end
  end
end

module BookKeeping
  VERSION = 1
end
