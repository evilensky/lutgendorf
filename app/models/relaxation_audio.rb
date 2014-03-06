class RelaxationAudio < ActiveRecord::Base
  has_attached_file :sound_file
  validates_attachment_presence :sound_file
  validates_attachment_content_type :sound_file, :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ],
                                    :message => 'file must be of filetype .mp3'

  validates_attachment_size :sound_file, :less_than => 10.megabytes

  has_many :listenings
  
  has_one :content_release
  
  
  accepts_nested_attributes_for :content_release
end
