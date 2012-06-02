class CreateSpeeches < ActiveRecord::Migration
  def change
    create_table :speeches do |t|
      t.date   :date
      t.integer :parliament_number
      t.integer :session_number
      t.integer :period_number
      t.string :member_id
      t.string :electorate
      t.string :party
      t.string :role
      t.text :content

      t.timestamps
    end
  end
end
