class Event < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  attr_accessible :date, :name, :location, :latitude, :longitude, :about_event

  validates :date, :name, :location, :about_event, presence: true, on: :create
  
  validate :date_future
  
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user
  has_many :comments, :as => :commentable 

  geocoded_by :location
  after_validation :geocode


  private

  def date_future
    errors.add :base, "Date must be in future" if date.past?
  end 

end
