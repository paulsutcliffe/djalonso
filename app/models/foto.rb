class Foto < ActiveRecord::Base
  # attr_accessible :title, :body

  mount_uploader :imagen, ImagenUploader
end
