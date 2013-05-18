class Album < ActiveRecord::Base
  attr_accessible :nombre, :imagen, :fotos_attributes

  has_many :fotos
  accepts_nested_attributes_for :fotos, :allow_destroy => true

  extend FriendlyId
  friendly_id :nombre, use: :slugged

end
