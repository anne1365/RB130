class School
  def initialize
    @school = Hash.new { |school, grade| school[grade] = [] }
  end

  def to_h
    @school.sort.map { |l, v| [l, v.sort] }.to_h
  end

  def add(name, grade)
    @school[grade] << name.capitalize
  end

  def grade(grade)
    @school.to_h[grade]
  end
end
