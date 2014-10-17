class RemoveUserFromAttendances < ActiveRecord::Migration
  def up
    remove_column :attendances, :user
  end

  def down
    add_column :attendances, :user, :string
  end
end
