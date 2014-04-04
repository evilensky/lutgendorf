class Listening < ActiveRecord::Base
  belongs_to :daily_relaxation_session, dependent: :destroy
  belongs_to :relaxation_audio, dependent: :destroy
end
