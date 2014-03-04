class CreateDailyRelaxationSessions < ActiveRecord::Migration
  def change
    create_table :daily_relaxation_sessions do |t|
      t.integer :pre_stress
      t.integer :post_stress

      t.timestamps
    end
  end
end
