
class DailyRelaxationSession < ActiveRecord::Base
  belongs_to :participant
  has_many :listenings
end
