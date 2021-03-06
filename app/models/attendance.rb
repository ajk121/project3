class Attendance < ActiveRecord::Base
  attr_accessible :name, :event_id, :user_id

  belongs_to :event
  belongs_to :user

  validates :event_id, uniqueness: { scope: :user_id }
end
