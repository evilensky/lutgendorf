class CreateGroupSessionMoodDetails < ActiveRecord::Migration
  def change
    create_table :group_session_mood_details do |t|
      t.integer :hope
      t.integer :safety
      t.integer :comfort
      t.integer :closeness
      t.integer :well_being
      t.integer :clarity
      t.integer :understanding
      t.integer :self_confidence
      t.references :participant, index: true

      t.timestamps
    end
  end
end
