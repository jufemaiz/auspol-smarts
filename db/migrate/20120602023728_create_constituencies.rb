class CreateConstituencies < ActiveRecord::Migration
  def change
    create_table :constituencies do |t|
      t.string :name
      t.boolean :main_name

      t.timestamps
    end
  end
end
