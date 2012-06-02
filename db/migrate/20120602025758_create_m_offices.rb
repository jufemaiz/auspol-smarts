class CreateMOffices < ActiveRecord::Migration
  def change
    create_table :m_offices do |t|
      # t.integer :moffice_id handled by m_offices.id
      t.string      :dept
      t.string      :position
      t.date        :from_date
      t.date        :to_date
      t.references  :person
      t.string      :source

      t.timestamps
    end
    add_index :m_offices, :person_id
  end
end
