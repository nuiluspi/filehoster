class UploadsController < ApplicationController
  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end
  
  # GET /compact
  # GET /compact.json
  def compact
    @uploads = Upload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @upload = Upload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @upload = Upload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(params[:upload])
    
    # This check is necessary, because the validators are apparently not called until AFTER these lines (would cause error if invalid form)
    if not params[:upload][:description].blank? and not params[:upload][:filename].blank?
	@upload.filecontent = params[:upload][:filename].read
	@upload.filename = params[:upload][:filename].original_filename
	@upload.filesize = params[:upload][:filename].size
	@upload.content_type = params[:upload][:filename].content_type.chomp
    end

    respond_to do |format|
      if @upload.save
        format.html { redirect_to compact_url, notice: 'Upload was successfully created.' }
        format.json { render json: compact_url, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @upload = Upload.find(params[:id])
    @upload.description = params[:upload][:description]
    respond_to do |format|
      if @upload.save
        format.html { redirect_to compact_url, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def download
	@upload = Upload.find(params[:upload_id])
	@upload.counter = @upload.counter+1
	send_data(@upload.filecontent, :type => @upload.content_type, :filename => @upload.filename, :disposition => 'download')
	@upload.save
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to compact_url, notice: 'Upload was succesfully deleted.' }
      format.json { head :no_content }
    end
  end
  
end

