class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.text :body, null: false
      t.integer :position, null: false, default: 1
      t.boolean :is_title_visible, null: false, default: true
      t.string :type
      t.text :options
      t.references :slideshow, index: true, null: false

      t.timestamps
    end
    
    add_index :slides, [:position, :slideshow_id], unique: true

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE slides
            ADD CONSTRAINT fk_slides_slideshows
            FOREIGN KEY (slideshow_id)
            REFERENCES slideshows(id)
        SQL
      end

      dir.down do
        execute <<-SQL
          ALTER TABLE slides
            DROP CONSTRAINT fk_slides_slideshows
        SQL
      end
    end
  end
end
