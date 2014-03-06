class CreateGroupSessionMoodSummaries < ActiveRecord::Migration
  def change
    create_table :group_session_mood_summaries do |t|
      t.integer :pre_anxious
      t.integer :pre_sad
      t.integer :pre_confused
      t.integer :pre_energy
      t.integer :pre_fatigue
      t.integer :post_anxious
      t.integer :post_sad
      t.integer :post_confused
      t.integer :post_energy
      t.integer :post_fatigue

      t.timestamps
    end
  end
end
