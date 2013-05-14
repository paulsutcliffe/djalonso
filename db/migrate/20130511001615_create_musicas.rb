class CreateMusicas < ActiveRecord::Migration
  def change
    create_table :musicas do |t|
      t.text :embed_code

      t.timestamps
    end
  end
end
