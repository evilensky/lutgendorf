class AddExtraAttributesToGroupSessionDetail < ActiveRecord::Migration
  def change
    add_column :group_session_mood_details, :session_satisfaction, :integer
    add_column :group_session_mood_details, :session_desire_for_future, :integer
    add_column :group_session_mood_details, :session_stress, :integer
  end
end
