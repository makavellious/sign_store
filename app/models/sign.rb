class Sign < ActiveRecord::Base
  attr_accessible :dir, :mod, :mod_dir, :name, :quantity, :price, :quantity, :location_id

  belongs_to :location
  before_validation :set_defaults
  validates :name, :mod, :quantity, :price, :location_id, presence: true
  validates :location_id, uniqueness: true

  def set_defaults
  	self.price ||= 5
  	self.quantity ||= 0
  	self.dir.upcase!
  	self.mod.capitalize!
  	self.name = self.name.titleize
  end

  def self.by_location(location_name)
  	l = Location.where(name: location_name.titleize).first
  	
  	unless l.nil?
  	 l.signs.all
  	else
  	 Sign.all
  	end

  end

end
