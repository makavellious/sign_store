class Sign < ActiveRecord::Base
  attr_accessible :dir, :mod, :mod_dir, :name, :price, :quantity, :location_id

  belongs_to :location
  before_validation :set_defaults
  validates :name, :mod, :quantity, :price, :location_id, presence: true
  
  def set_defaults
  	self.price ||= 5
  	self.quantity ||= 0
  	self.dir.upcase!
  	self.mod.upcase!
  	self.name = self.name.titleize
  end

  def update_quantity(n)
    self.quantity += n
    true if self.save
  end

  def to_s
    "#{self.id}#{self.name[0,3]}"
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
