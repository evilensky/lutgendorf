class CreateListenings < ActiveRecord::Migration
  def change
    create_table :listenings do |t|
      t.references :daily_relaxation_session, index: true
      t.references :relaxation_audio, index: true

      t.timestamps
    end
  end
end
