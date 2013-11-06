class Upload < ActiveRecord::Base
  attr_accessible :counter, :description, :filename, :filepath, :uploaddate, :uploader
end
