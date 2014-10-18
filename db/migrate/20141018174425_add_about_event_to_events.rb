class AddAboutEventToEvents < ActiveRecord::Migration
  def change
    add_column :events, :about_event, :text
  end
end
