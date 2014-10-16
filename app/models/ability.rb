class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    # elsif user.role == 'approved'
      # can :read, Event

    #elsif user.role? == 'declinded'


    #elsif user.role? == 'pending'
    end
  end
end
