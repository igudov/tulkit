class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:index]
  skip_before_action :authorize, only: [:create, :new ]

  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    @users = User.order(:name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    unless @user.id == session[:user_id] || User.find_by(id: session[:user_id]).access == 'administrator'
      respond_to do |format|
        format.html {redirect_to jobs_url, notice: "Access denied"}
        format.json {head :no_content}
      end
    end
  end

  # GET /users/new
  def new
    
    if (not session[:user_id]) || User.find_by(id: session[:user_id]).access == 'administrator'
      @user = User.new
    else
      respond_to do |format|
        format.html {redirect_to jobs_url, notice: "Access denied"}
        format.json {head :no_content}
      end
    end
  end

  # GET /users/1/edit
  def edit
    unless @user.id == session[:user_id] || User.find_by(id: session[:user_id]).access == 'administrator'
      respond_to do |format|
        format.html {redirect_to jobs_url, notice: "Access denied"}
        format.json {head :no_content}
      end
    end
  end

  # POST /users
  # POST /users.json
  def create
    if (not session[:user_id]) || User.find_by(id: session[:user_id]).access == 'administrator'
      @user = User.new(user_params)
      @user.bidder = TRUE
      respond_to do |format|
        if @user.save
          format.html { redirect_to jobs_url, notice: "User #{@user.name} was successfully created." }
          format.json { render action: 'show', status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html {redirect_to jobs_url, notice: "Access denied"}
        format.json {head :no_content}
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.id == session[:user_id] || User.find_by(id: session[:user_id]).access == 'administrator'
      respond_to do |format|      
        if @user.update(user_params)
          format.html { redirect_to jobs_url, notice: "User #{@user.name} was successfully updated." }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
     respond_to do |format|
        format.html {redirect_to jobs_url, notice: "Access denied"}
        format.json {head :no_content}
      end
    end 
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user.id == session[:user_id] || User.find_by(id: session[:user_id]).access == 'administrator'
      begin
        @user.destroy
        flash[:notice] = "User #{@user.name} deleted"
        unless User.find_by(id: session[:user_id]).access == 'administrator' 
          session[:user_id]=nil
        end
      rescue StandardError => e
        flash[:notice] = e.message
      end        
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
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :email, :avatar_url, :phone, :bidder, :access, :info, :avatar)
    end
end
