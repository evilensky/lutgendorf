class CreateWebexes < ActiveRecord::Migration
  def change
    create_table :webexes do |t|
      t.string :url
      t.datetime :meeting_time

      t.timestamps
    end
  end
end
