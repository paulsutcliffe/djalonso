class CreateServicios < ActiveRecord::Migration
  def change
    create_table :servicios do |t|
      t.string :nombre
      t.text :descripcion
      t.text :equipos
      t.text :fotografia

      t.timestamps
    end
  end
end
