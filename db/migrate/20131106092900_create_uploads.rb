class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :filename
      t.string :filepath
      t.text :description
      t.string :uploader
      t.integer :counter
      t.datetime :uploaddate

      t.timestamps
    end
  end
end
