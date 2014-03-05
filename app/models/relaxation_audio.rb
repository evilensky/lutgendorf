class RelaxationAudio < ActiveRecord::Base
  has_attached_file :sound_file

  has_many :listenings
  
  has_one :content_release
  
  validates :sound_file, attachment_presence: true
  
  validates :title, presence: true

  accepts_nested_attributes_for :content_release
end
