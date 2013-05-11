class Album < ActiveRecord::Base
  attr_accessible :nombre

  has_many :fotos

  extend FriendlyId
  friendly_id :nombre, use: :slugged

end
