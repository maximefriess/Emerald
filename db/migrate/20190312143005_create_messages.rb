class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :listing, foreign_key: true
      t.string :title
      t.string :content
      t.string :doc_type

      t.timestamps
    end
  end
end
