class RemoveGratitudeTextFromDailyJournal < ActiveRecord::Migration
  def change
    remove_column :daily_journals, :gratitude_text, :text
  end
end
