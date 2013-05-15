class AddSlideToDiapositivas < ActiveRecord::Migration
  def change
    add_column :diapositivas, :slide, :string
  end
end
