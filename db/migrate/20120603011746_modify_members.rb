class ModifyMembers < ActiveRecord::Migration
  def up
    change_table :members do |m|
      m.string :aphkey
    end
  end

  def down
    remove_column :members, :aphkey
  end
end
