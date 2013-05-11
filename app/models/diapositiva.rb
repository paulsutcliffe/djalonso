class Diapositiva < ActiveRecord::Base
  # attr_accessible :title, :body

  mount_uploader :slide, SlideUploader
end
