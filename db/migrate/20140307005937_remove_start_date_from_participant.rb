class RemoveStartDateFromParticipant < ActiveRecord::Migration
  def up
    remove_column :participants, :start_date
  end
  def down
    add_column :participants, :start_date, :date
  end
end
