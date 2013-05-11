class CreateAlbumes < ActiveRecord::Migration
  def change
    create_table :albumes do |t|
      t.string :nombre
      t.string :slug

      t.timestamps
    end
    add_index :albumes, :slug, unique: true
  end
end
