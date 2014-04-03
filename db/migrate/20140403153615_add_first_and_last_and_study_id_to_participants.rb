class AddFirstAndLastAndStudyIdToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :first_name, :string
    add_column :participants, :last_name, :string
    add_column :participants, :study_identification, :string
  end
end
