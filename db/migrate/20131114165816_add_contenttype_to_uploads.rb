class AddContenttypeToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :contenttype, :string
  end
end
