class RemoveGratitudeTextFromDailyJournal < ActiveRecord::Migration
  
  def up
    remove_column :daily_journals, :gratitude_text
  end

  def down
    add_column :daily_journals, :gratitude_text, :text
  end

end
