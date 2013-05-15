class AddFotografiaToServicios < ActiveRecord::Migration
  def change
    add_column :servicios, :fotografia, :string
  end
end
