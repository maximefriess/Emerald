class AddContentToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :content, :string
    add_column :photos, :story, :text
  end
end
