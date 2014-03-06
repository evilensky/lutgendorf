class AddParticipantToGroupSessionMoodSummary < ActiveRecord::Migration
  def change
    add_reference :group_session_mood_summaries, :participant, index: true
  end
end
