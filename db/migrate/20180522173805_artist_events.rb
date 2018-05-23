class ArtistEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_events do |t|
    t.references :artist_id
    t.references :event_id

    t.timestamps
    end
  end
end
