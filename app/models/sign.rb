class Sign < ActiveRecord::Base
  attr_accessible :dir, :mod, :mod_dir, :name, :quantity

  belongs_to :location
  before_validation :set_defaults
  validates :name, :mod, :quantity, :price, presence: true

  def set_defaults
  	self.price ||= 5
  	self.quantity ||= 0
  end
end
