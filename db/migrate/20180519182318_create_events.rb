class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :date
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
