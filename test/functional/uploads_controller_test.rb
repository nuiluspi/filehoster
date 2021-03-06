require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
	
   include Devise::TestHelpers  
   setup do
      @upload = uploads(:one)
      @user = User.create!(
        :email => 'testuser@demomailtest.com',
        :password => 'MyTestingPassword',
        :password_confirmation => 'MyTestingPassword'
      )
      sign_in @user
   end
	

  test "should get index" do
    get :index
    assert_response 200
    assert_not_nil assigns(:uploads)
  end

  test "should get new" do
    get :new
    assert_response 200
  end

  test "should create upload" do
    assert_difference('Upload.count') do
      post :create, upload: { content_type: @upload.content_type, counter: @upload.counter, description: @upload.description, filecontent: @upload.filecontent, filename: @upload.filename, filesize: @upload.filesize, uploaddate: @upload.uploaddate }
    end

    assert_redirected_to compact_path
  end

  test "should show upload" do
    get :show, id: @upload
    assert_response 200
  end

  test "should get edit" do
    get :edit, id: @upload
    assert_response 200
  end

  test "should update upload" do
    put :update, id: @upload, upload: { content_type: @upload.content_type, counter: @upload.counter, description: @upload.description, filecontent: @upload.filecontent, filename: @upload.filename, filesize: @upload.filesize, uploaddate: @upload.uploaddate }
    assert_redirected_to compact_path
  end

  test "should destroy upload" do
    assert_difference('Upload.count', -1) do
      delete :destroy, id: @upload
    end

    assert_redirected_to compact_path
  end
end
