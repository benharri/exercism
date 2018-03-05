class School
  def initialize
    @grades = Hash.new {|h, k| h[k] = [] }
  end

  def add(name, grade)
    @grades[grade] << name
  end

  def students(grade)
    @grades[grade].sort
  end

  def students_by_grade
    @grades.sort.reduce([]) do |memo, (k, _v)|
      memo << {grade: k, students: students(k)}
    end
  end
end

module BookKeeping
  VERSION = 3
end
