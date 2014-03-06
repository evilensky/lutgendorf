class Values::Likert
  def self.from_value(value)
    if value  == 0 || value == 5
      new("A great deal")
    elsif value == 1 || value == 4
      new("Moderately")
    else
      new("A little bit")
    end
  end

  def initialize(label)
    @label = label
  end

  def to_s
    @label.to_s
  end
end