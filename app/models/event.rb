class Event < ActiveRecord::Base
  attr_accessible :date, :name, :location
  
  has_many :attendances
end
