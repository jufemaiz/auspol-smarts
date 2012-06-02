class CreatePbcMembers < ActiveRecord::Migration
  def change
    create_table :pbc_members do |t|
      t.references :member
      t.boolean :chairman
      t.references :bill
      t.string :sitting
      t.boolean :attending

      t.timestamps
    end
    add_index :pbc_members, :member_id
    add_index :pbc_members, :bill_id
  end
end
