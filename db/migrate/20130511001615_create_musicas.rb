class CreateMusicas < ActiveRecord::Migration
  def change
    create_table :musicas do |t|
      t.string :embed_code

      t.timestamps
    end
  end
end
