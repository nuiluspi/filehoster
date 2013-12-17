require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  test "uploads attributes must not be empty" do
	  upload = Upload.new
	  assert upload.invalid?
	  assert upload.errors[:filename].any?
	  assert upload.errors[:description].any?
	  assert upload.errors[:uploaddate].any?
	  assert upload.errors[:filesize].any?
	  assert upload.errors[:counter].any?
	  assert upload.errors[:filecontent].any?
	  assert upload.errors[:content_type].any?
  end
  
  test "uploads counter must be at least zero" do
	  upload = uploads(:two)
	  upload.counter = -1
	  assert upload.invalid?
  end
end
