class CreateConsInfo < ActiveRecord::Migration
  def change
    create_table :cons_info do |t|
      t.string :constituency
      t.string :data_key
      t.text :data_value

      t.timestamps
    end
    execute <<-SQL
          ALTER TABLE cons_info
            ADD KEY (category_id)
            REFERENCES categories(id)
        SQL
      KEY `from_date` (`from_date`),
      KEY `to_date` (`to_date`),
      KEY `name` (`name`),
      KEY `constituency` (`cons_id`)
  end
end
