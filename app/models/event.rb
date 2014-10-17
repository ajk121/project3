class Event < ActiveRecord::Base
  attr_accessible :date, :name, :location
  
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user
end
