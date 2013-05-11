class Album < ActiveRecord::Base
  attr_accessible :nombre

  extend FriendlyId
  friendly_id :nombre, use: :slugged

end
