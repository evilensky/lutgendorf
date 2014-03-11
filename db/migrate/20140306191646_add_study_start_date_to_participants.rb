class AddStudyStartDateToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :study_start_date, :datetime
  end
end
