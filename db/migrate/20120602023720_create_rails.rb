class CreateRails < ActiveRecord::Migration
  def change
    create_table :rails do |t|
      t.string :generate
      t.string :scaffold
      t.string :ConsInfo
      t.string :constituency
      t.string :data_key
      t.text :data_value

      t.timestamps
    end
  end
end
