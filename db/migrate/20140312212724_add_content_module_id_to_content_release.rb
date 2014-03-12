class AddContentModuleIdToContentRelease < ActiveRecord::Migration
  def change
    add_reference :content_releases, :content_module, index: true
  end
end
