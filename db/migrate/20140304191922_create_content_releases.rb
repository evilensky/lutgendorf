class CreateContentReleases < ActiveRecord::Migration
  def change
    create_table :content_releases do |t|
      t.date :release_date
      t.integer :slideshow_id

      t.timestamps
    end
  end
end
