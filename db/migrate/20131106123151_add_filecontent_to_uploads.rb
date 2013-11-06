class AddFilecontentToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :filecontent, :text
  end
end
