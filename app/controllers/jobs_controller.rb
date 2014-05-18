class JobsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_job, only: [:show, :edit, :update, :destroy]  

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.order(updated_at: :desc)
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    unless @job.user_id == session[:user_id] || User.find_by(id: session[:user_id]).access == 'administrator'
      respond_to do |format|
        format.html {redirect_to jobs_url, notice: "Access denied"}
        format.json {head :no_content}
      end
    end
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.user_id = session[:user_id]

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job }
      else
        format.html { render action: 'new' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    if @job.user_id == session[:user_id] || User.find_by(id: session[:user_id]).access == 'administrator'      
      respond_to do |format|
        if @job.update(job_params)
          format.html { redirect_to @job, notice: 'Job was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html {redirect_to jobs_url, notice: "Access denied"}
        format.json {head :no_content}
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    if @job.user_id == session[:user_id] || User.find_by(id: session[:user_id]).access == 'administrator'      
      @job.destroy
      respond_to do |format|
        format.html { redirect_to jobs_url }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html {redirect_to jobs_url, notice: "Access denied"}
        format.json {head :no_content}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :image_url, :category_id, :status, :from, :to, :user_id)
    end
end
