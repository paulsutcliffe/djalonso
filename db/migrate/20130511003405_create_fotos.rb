class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.integer :album_id
      t.integer :evento_id

      t.timestamps
    end
  end
end
