class AdminController < ApplicationController
	def index
		@total_jobs = Job.count
	end
end