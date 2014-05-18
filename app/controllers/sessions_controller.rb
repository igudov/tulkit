class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		if user.access == 'administrator'
        redirect_to admin_url
      else
        redirect_to jobs_url
      end
  	else
  		redirect_to login_url, alert: "Invalid user/password combination"
  	end	
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to jobs_url, notice: "Logged out"
  end
end
