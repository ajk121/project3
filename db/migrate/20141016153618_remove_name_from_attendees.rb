class RemoveNameFromAttendees < ActiveRecord::Migration
  def up
    remove_column :attendees, :name
  end

  def down
    add_column :attendees, :name, :string
  end
end
