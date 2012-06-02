class CreateMemberInfos < ActiveRecord::Migration
  def change
    create_table :member_infos do |t|
      t.references :member
      t.string :data_key
      t.text :data_value
      t.timestamp :lastupdate

      t.timestamps
    end
    add_index :member_infos, :member_id
  end
end
