class CreateIndexBatches < ActiveRecord::Migration
  def change
    create_table :index_batches do |t|
      t.integer :indexbatch_id
      t.datetime :created

      t.timestamps
    end
  end
end
