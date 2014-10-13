class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :house
      t.string :email
      t.string :password
      t.string :school
      t.string :location
      t.date :dob

      t.timestamps
    end
  end
end
