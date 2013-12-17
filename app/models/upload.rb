class Upload < ActiveRecord::Base
  attr_accessible :content_type, :counter, :description, :filecontent, :filename, :filesize, :uploaddate
  
  validates_presence_of :description, :filename, :uploaddate, :filesize, :counter, :filecontent, :content_type
  
  validates :counter, :numericality => { :greater_than_or_equal_to => 0 }
  
end
