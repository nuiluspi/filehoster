class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  before_filter :authenticate_user!
  
  
 def logout
    reset_session
    respond_to do |format|
      format.html { redirect_to new_user_session_url, notice: 'Signed out successfully.' }
      format.json { head :no_content }
    end
  end   
  
end
