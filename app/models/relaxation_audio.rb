class RelaxationAudio < ActiveRecord::Base
  has_attached_file :sound_file

  has_many :listenings
  
  validates :sound_file, attachment_presence: true
  validates :title, presence: true
end
