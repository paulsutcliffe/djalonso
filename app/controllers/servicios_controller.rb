class ServiciosController < InheritedResources::Base


  def create
    create!{servicios_path}
  end
  def update
    update!{servicios_path}
  end
  
end
