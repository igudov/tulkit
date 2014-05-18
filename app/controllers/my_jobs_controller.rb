class MyJobsController < ApplicationController
  def index
  	user = User.find_by(id: session[:user_id])
  	@my_jobs = user.jobs
  end
end
