class AddTitleToRelaxationAudio < ActiveRecord::Migration
  def change
    add_column :relaxation_audios, :title, :string
  end
end
