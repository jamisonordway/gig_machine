class CreateArtistsEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :artists_events do |t|
      t.references :event, foreign_key: true
      t.references :artist, foreign_key: true
    end
  end
end
