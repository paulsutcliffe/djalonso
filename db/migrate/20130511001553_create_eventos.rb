class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :titulo
      t.date :fecha

      t.timestamps
    end
  end
end
