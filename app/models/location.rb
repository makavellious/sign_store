class Location < ActiveRecord::Base
  attr_accessible :name

  before_validation :set_defaults

  has_many :signs

  validates :name, {presence: true, uniqueness: true}

  def set_defaults
  	self.name.capitalize!
  end
end
