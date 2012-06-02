class CreatePostcodeLookups < ActiveRecord::Migration
  def change
    create_table :postcode_lookups do |t|
      t.string :postcode
      t.string :name

      t.timestamps
    end
  end
end
