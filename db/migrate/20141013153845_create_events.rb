class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.integer :creater_id
      t.integer :attendee_id

      t.timestamps
    end
  end
end
