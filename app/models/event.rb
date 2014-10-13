class Event < ActiveRecord::Base
  attr_accessible :attendee_id, :creater_id, :date, :name
end
