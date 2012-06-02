class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :member_id
      t.integer :house
      t.string :first_name
      t.string :last_name
      t.string :constituency
      t.string :party
      t.date :entered_house
      t.date :left_house
      t.string :enetered_reason
      t.string :left_reason
      t.integer :person_id
      t.string :title
      t.timestamp :lastupdate

      t.timestamps
    end
  end
end