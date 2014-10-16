class RemoveCreaterIdFromEvent < ActiveRecord::Migration
  def up
    remove_column :events, :creater_id
  end

  def down
    add_column :events, :creater_id, :integer
  end
end
