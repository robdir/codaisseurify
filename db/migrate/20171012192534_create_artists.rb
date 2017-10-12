class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :formed
      t.text :bio
      t.string :genre

      t.timestamps
    end
  end
end
