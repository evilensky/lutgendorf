
class DailyRelaxationSession < ActiveRecord::Base
  belongs_to :participant
  has_many :relaxation_audios
  has_many :listenings
end
