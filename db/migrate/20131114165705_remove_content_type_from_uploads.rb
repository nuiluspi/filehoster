class RemoveContentTypeFromUploads < ActiveRecord::Migration
  def up
    remove_column :uploads, :content_type
  end

  def down
    add_column :uploads, :content_type, :string
  end
end
