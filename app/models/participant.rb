class Participant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :participant_status
  has_many :daily_relaxation_sessions
  has_many :daily_journals
  has_many :listenings, :through => :daily_relaxation_sessions
  has_many :group_session_mood_details
  has_many :group_session_mood_summaries

  def build_data_record(association, attributes)
    send(association).build(attributes)
  end

  def fetch_data_record(association, id)
    send(association).find(id)
  end

  def navigation_status
    participant_status || build_participant_status
  end

end
