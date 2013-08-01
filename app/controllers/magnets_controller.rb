class MagnetsController < ApplicationController

  # GET /magnets
  # GET /magnets.json

  before_filter :authenticate_user!
  
  def index
    @magnets = current_user.magnets.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @magnets }
    end
  end

  # GET /magnets/1
  # GET /magnets/1.json
  def show
    @magnet = current_user.magnets.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @magnet }
    end
  end 

  # GET /magnets/new
  # GET /magnets/new.json
  def new    
    @magnet = Magnet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @magnet }
    end
  end

  # GET /magnets/1/edit
  def edit

    @magnet = current_user.magnets.find(params[:id])

  end

  # POST /magnets
  # POST /magnets.json
  def create

    url = params[:magnet][:url].split(/[\n]/)

    # Splitting the list in a new line and save
    url.each do |u|
      params[:magnet][:url] = u
      @magnet = current_user.magnets.create(params[:magnet])
    end

    respond_to do |format|
      if @magnet.save
        format.html { redirect_to magnets_path, notice: 'Magnet was successfully created.' }
        format.json { render json: @magnet, status: :created, location: @magnet }
      else
        format.html { render action: "new" }
        format.json { render json: @magnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /magnets/1
  # PUT /magnets/1.json
  def update
    @magnet = current_user.magnets.find(params[:id])

    respond_to do |format|
      if @magnet.update_attributes(params[:magnet])
        format.html { redirect_to @magnet, notice: 'Magnet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @magnet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magnets/1
  # DELETE /magnets/1.json
  def destroy
    @magnet = current_user.magnets.find(params[:id])
    @magnet.destroy

    respond_to do |format|
      format.html { redirect_to magnets_url }
      format.json { head :no_content }
    end
  end

  def delete_all

    @magnets = current_user.magnets.all
    @magnets.each do |magnet|
      magnet.destroy
    end    

    respond_to do |format|
      format.html { redirect_to magnets_url }
      format.json { head :no_content }
    end    
  end
end