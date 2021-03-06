class Api::UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
		@user = User.new(user_params)

		if @user.save
			login(@user)
			render "api/users/show"  # user profile page
		else
			render json: @user.errors.full_messages, status: 422
		end
	end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  def update
    
  end

  def destroy

  end
  
  private

  def user_params
		params.require(:user).permit(:username, :password, :email)
	end
  # username is not unique, email is!!!
end
