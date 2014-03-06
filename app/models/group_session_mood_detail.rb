class GroupSessionMoodDetail < ActiveRecord::Base
  belongs_to :participant

  def likert_label(feeling)
    Values::Likert.from_value(feeling)
  end
  
end
