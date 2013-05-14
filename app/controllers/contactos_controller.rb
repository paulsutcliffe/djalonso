class ContactosController < InheritedResources::Base

  def create
    create!{new_contacto_path}
  end
end
