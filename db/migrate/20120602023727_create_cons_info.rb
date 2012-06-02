class CreateConsInfo < ActiveRecord::Migration
  def change
    create_table :cons_infos do |t|
      t.string :constituency
      t.string :data_key
      t.text :data_value

      t.timestamps
    end
  end
end
