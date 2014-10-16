class Attendee < ActiveRecord::Base
  attr_accessible :name, :event_id

  belongs_to :event
  belongs_to :user
end
