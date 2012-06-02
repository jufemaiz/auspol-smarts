class CreateEpObjects < ActiveRecord::Migration
  def change
    create_table :ep_objects do |t|
      t.integer :epobject_id
      t.string :title
      t.text :body
      t.integer :type

      t.timestamps
    end
  end
end
