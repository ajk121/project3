class RemoveAttendeeIdFromEvent < ActiveRecord::Migration
  def up
    remove_column :events, :attendee_id
  end

  def down
    add_column :events, :attendee_id, :integer
  end
end
