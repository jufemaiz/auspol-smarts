class CreateGidRedirects < ActiveRecord::Migration
  def change
    create_table :gid_redirects do |t|
      t.string :gid_from
      t.string :gid_to
      t.date :hdate
      t.integer :major

      t.timestamps
    end
  end
end
