class AddSelfGuidedToListenings < ActiveRecord::Migration
  def change
    add_column :listenings, :self_guided, :boolean, default: false
  end
end
