class Upload < ActiveRecord::Base
  attr_accessible :content_type, :counter, :description, :filecontent, :filename, :filesize, :uploaddate
  
  validates_presence_of :description, :filename
  
end
