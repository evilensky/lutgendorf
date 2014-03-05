class CreateContentReleases < ActiveRecord::Migration
  def change
    create_table :content_releases do |t|
      t.integer :release_date
      t.references :slideshow
      t.references :relaxation_audio 

      t.timestamps
    end
  end
end
