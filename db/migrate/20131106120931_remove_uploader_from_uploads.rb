class RemoveUploaderFromUploads < ActiveRecord::Migration
  def up
    remove_column :uploads, :uploader
  end

  def down
    add_column :uploads, :uploader, :string
  end
end
