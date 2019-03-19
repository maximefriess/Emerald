class AddColumnDisplayNameToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :display_name, :string
  end
end
