class CreateDiapositivas < ActiveRecord::Migration
  def change
    create_table :diapositivas do |t|

      t.timestamps
    end
  end
end
