class CreateHansards < ActiveRecord::Migration
  def change
    create_table :hansards do |t|
      t.references :epobject_id
      t.string :git
      t.integer :htype
      t.references :speaker_id
      t.integer :major
      t.integer :section_id
      t.integer :subsection_id
      t.integer :hpos
      t.date :hdate
      t.time :htime
      t.string :source_url
      t.integer :minor

      t.timestamps
    end
    add_index :hansards, :epobject_id_id
    add_index :hansards, :speaker_id_id
  end
end
