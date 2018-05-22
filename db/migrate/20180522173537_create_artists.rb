class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.string :link
      t.string :img
      t.integer :user_id

      t.timestamps
    end
  end
end
