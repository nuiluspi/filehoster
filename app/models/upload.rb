class Upload < ActiveRecord::Base
	
	validates :filename, :description, :presence => true
	
	attr_accessible :counter, :description, :filename, :uploaddate
  
	def download_file(upload)
		send_data upload.filecontent, :disposition => 'attachment'
	end
end
