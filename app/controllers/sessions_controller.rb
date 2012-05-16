class SessionsController < ApplicationController
  def new
  	@title ="Sign In"
  end

  def create
  	user = User.authenticate(params[:session][:email],
  							 params[:session][:password])

  	if user.nil?
  		flash.now[:error] = "Invalid email/password combination!"
  		@title = "Sign in"
  		render 'new'
  	elsif user.name.nil?
      sign_in user
      redirect_back_or newusersetup_path
    else
  		sign_in user
  		redirect_back_or profile_path
  	end

  end

  def destroy
  	sign_out
  	redirect_to root_path
  end

end
