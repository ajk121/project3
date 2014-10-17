class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :event
      t.string :user

      t.timestamps
    end
  end
end
