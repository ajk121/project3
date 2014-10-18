class Event < ActiveRecord::Base
  attr_accessible :date, :name, :location, :latitude, :longitude
  
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

 geocoded_by :location
  after_validation :geocode

end
