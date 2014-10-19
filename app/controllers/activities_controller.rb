class ActivitiesController < ApplicationController
  def index
    @activities = ::PublicActivity::Activity.order("created_at desc")
  end
end


# .where(owner_id: current_user.friend_ids, owner_type: "User")