class Upload < ActiveRecord::Base
	
	validates :filename, :description, :presence => true
	
	attr_accessible :counter, :description, :filename, :uploaddate

end
