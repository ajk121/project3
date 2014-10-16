class Event < ActiveRecord::Base
  attr_accessible :date, :name
  
  has_many :attendees
  has_many :users, through: :attendees
end
