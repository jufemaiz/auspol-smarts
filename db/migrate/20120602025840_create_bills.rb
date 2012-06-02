class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :title
      t.string :url
      t.boolean :lords
      t.string :session
      t.string :standingprefix

      t.timestamps
    end
  end
end
