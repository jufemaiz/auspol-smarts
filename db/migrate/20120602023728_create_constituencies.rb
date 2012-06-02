class CreateConstituencies < ActiveRecord::Migration
  def change
    create_table :constituencies do |t|
      t.string :name
      t.boolean :main_name
      t.date  :from_date,     :null => false,   :default => Date.new(1000,1,1)
      t.date  :to_date,       :null => false,   :default => Date.new(9999,12,31)

      t.timestamps
    end
  end
end
