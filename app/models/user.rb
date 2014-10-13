class User < ActiveRecord::Base
  attr_accessible :dob, :email, :house, :location, :name, :password, :school
end
