class UsersController < ApplicationController

  def allusers
	@users = User.all
	respond_to do |format|
	format.html # index.html.erb
	format.json { render json: @uploads }
    end
  end
  
  def approve
	@user = User.find(params[:user_id])
	@user.approved = "t"
	respond_to do |format|
		if @user.save
			format.html { redirect_to allusers_url, notice: 'User was approved succesfully.' }
			format.json { render json: allusers_url, status: :updated, location: @user }
		else
			format.html { render action: "allusers" }
			format.json { render json: @user.errors, status: :unprocessable_entity }
		end
	end
  end
  
  def disapprove
	@user = User.find(params[:user_id])
	@user.approved = "f"
	respond_to do |format|
		if @user.save
			format.html { redirect_to allusers_url, notice: 'User was DISapproved succesfully.' }
			format.json { render json: allusers_url, status: :updated, location: @user }
		else
			format.html { render action: "allusers" }
			format.json { render json: @user.errors, status: :unprocessable_entity }
		end
	end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
        redirect_to allusers_url, notice: "User deleted."
    end
  end

end
