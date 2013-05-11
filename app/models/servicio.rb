class Servicio < ActiveRecord::Base
  attr_accessible :descripcion, :equipos, :nombre

  mount_uploader :fotografia, FotografiaUploader
end
