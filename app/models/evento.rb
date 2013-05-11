class Evento < ActiveRecord::Base
  attr_accessible :fecha, :titulo

  has_many :fotos
end
