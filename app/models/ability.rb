class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    elsif user.role == 'approved'
      can :read, Event
      can :show, User
      can [:update, :edit], User, id: user.id
      if user.persisted?
       can :create, Comment 
       can :update, Comment, user_id: user.id
     end
   elsif user.role == 'pending'
      can :show, Home 
   end 

   # elsif user.role == 'declined'

   #  end 




   
  end
end
