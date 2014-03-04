class CreateRelaxationAudios < ActiveRecord::Migration
  def change
    create_table :relaxation_audios do |t|

      t.timestamps
    end
  end
end
