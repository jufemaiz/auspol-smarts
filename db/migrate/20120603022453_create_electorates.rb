class CreateElectorates < ActiveRecord::Migration
  def change
    create_table :electorates do |t|
      t.string  :title
      t.string  :state
      t.integer :area
      t.text    :description
      t.text    :polygon

      t.timestamps
    end
  end
end
