class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :dob, :house, :location, :school, :role 

  has_many :messages_as_sender, class_name: 'Message', foreign_key: :sender_id, dependent: :destroy 
  has_many :messages_as_receiver, class_name: 'Message', foreign_key: :receiver_id, dependent: :destroy 

  has_many :attendees
  has_many :events, through: :attendees

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end
  
end
