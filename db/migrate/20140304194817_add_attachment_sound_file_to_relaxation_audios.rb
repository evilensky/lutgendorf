class AddAttachmentSoundFileToRelaxationAudios < ActiveRecord::Migration
  def self.up
    change_table :relaxation_audios do |t|
      t.attachment :sound_file
    end
  end

  def self.down
    drop_attached_file :relaxation_audios, :sound_file
  end
end
