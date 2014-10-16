class Event < ActiveRecord::Base
  attr_accessible :attendee_id, :creater_id, :date, :name
  
  has_many :attendees
  has_many :users, through: :attendees
end
