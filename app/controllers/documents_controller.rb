class DocumentsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    #@documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # @http_method XHR POST
  # @url /documents
  def create
    #current_user = User.find_by(id: session[:user_id])
    @job = Job.find(params[:job_id])

    params[:user_id] = session[:user_id]
    
    #@document = @job.documents.create(document_params)
    @document = @job.documents.build(document_params)
    @document.user_id = session[:user_id]
    
    
    @document.save
    #@document.job_id = 0    
    
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    params[:user_id] = session[:user_id]
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document_id=@document.id
    if @document.user == User.find_by(id: session[:user_id])
      @document.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:user_id, :direct_upload_url, :upload, :processed, :job_id)
    end
end
