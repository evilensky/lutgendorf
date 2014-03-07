class RemoveStartDateFromParticipant < ActiveRecord::Migration
  def change
    remove_column :participants, :start_date
  end
end
