class CreatePersonInfos < ActiveRecord::Migration
  def change
    create_table :person_infos do |t|
      t.references    :person
      t.string        :data_key
      t.text          :data_value
      t.timestamp     :lastupdate

      t.timestamps
    end
    add_index :person_infos, :person_id
  end
end
