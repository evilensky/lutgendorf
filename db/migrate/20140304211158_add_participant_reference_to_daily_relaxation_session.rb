class AddParticipantReferenceToDailyRelaxationSession < ActiveRecord::Migration
  def change
    add_reference :daily_relaxation_sessions, :participant, index: true
  end
end
