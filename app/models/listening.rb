class Listening < ActiveRecord::Base
  belongs_to :daily_relaxation_session
  belongs_to :relaxation_audio
end
