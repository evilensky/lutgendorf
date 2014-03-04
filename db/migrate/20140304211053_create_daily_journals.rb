class CreateDailyJournals < ActiveRecord::Migration
  def change
    create_table :daily_journals do |t|
      t.integer :average_stress
      t.integer :average_sleep_quality
      t.text :meaningful_text
      t.text :gratitude_text
      t.references :participant, index: true

      t.timestamps
    end
  end
end
