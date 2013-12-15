class Upload < ActiveRecord::Base
  attr_accessible :content_type, :counter, :description, :filecontent, :filename, :filesize, :uploaddate
end
