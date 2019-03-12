class DeleteColumnOnPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :story
  end
end
