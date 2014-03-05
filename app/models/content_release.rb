class ContentRelease < ActiveRecord::Base
  belongs_to :slideshow
  belongs_to :relaxation_audio
end
