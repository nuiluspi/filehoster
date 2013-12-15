class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :filename
      t.text :description
      t.datetime :uploaddate
      t.integer :filesize
      t.integer :counter
      t.binary :filecontent
      t.string :content_type

      t.timestamps
    end
  end
end
