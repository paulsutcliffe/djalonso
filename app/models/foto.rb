class Foto < ActiveRecord::Base
   attr_accessible :imagen

  belongs_to :albumes
  belongs_to :eventos

  mount_uploader :imagen, ImagenUploader
end
