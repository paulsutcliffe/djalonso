class Servicio < ActiveRecord::Base
  attr_accessible :descripcion, :equipos, :nombre, :fotografia

  mount_uploader :fotografia, FotografiaUploader

  extend FriendlyId
  friendly_id :nombre, use: :slugged
end
