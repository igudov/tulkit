class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:show, :index, :new, :edit]

  # GET /bids
  # GET /bids.json
  def index
    @bids = Bid.all
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
  end

  # GET /bids/new
  def new
    @bid = Bid.new
  end

  # GET /bids/1/edit
  def edit
  end

  # POST /bids
  # POST /bids.json
  def create
    @bid = Bid.new(bid_params)    
    @bid.user = User.find_by(id: session[:user_id])    

    respond_to do |format|
      if @bid.save
        format.html { redirect_to @bid.job, notice: 'Bid was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bid }
      else
        format.html { render action: 'new' }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid.job, notice: 'Bid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @job = @bid.job
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to @job }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:description, :price, :image_url, :user_id, :job_id)
    end
end
