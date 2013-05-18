class Evento < ActiveRecord::Base
  attr_accessible :fecha, :titulo, :imagen, :fotos_attributes

  has_many :fotos
  accepts_nested_attributes_for :fotos, :allow_destroy => true

  extend FriendlyId
  friendly_id :title_with_date, :use => :slugged

  protected
  def title_with_date
    fecha.strftime('%Y-%m-%d') + "/" + titulo
  end
end
