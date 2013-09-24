class SignsController < ApplicationController
  # GET /signs
  # GET /signs.json
  def index

    unless params[:name].nil? #Sets location instance if a location name was added in the route
      @signs = Sign.by_location(params[:name])
      @location = Location.where(name: params[:name].titleize).first
    else
      @signs = Sign.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @signs }
    end
  end

  # GET /signs/1
  # GET /signs/1.json
  def show
    @sign = Sign.find(params[:id])
    @location = Location.find(@sign.location_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sign }
    end
  end

  # GET /signs/new
  # GET /signs/new.json
  def new
    @sign = Sign.new
    @location = Location.where(name: params[:name].titleize).first unless params[:name].nil?

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sign }
    end
  end

  # GET /signs/1/edit
  def edit
    @sign = Sign.find(params[:id])
  end

  # POST /signs
  # POST /signs.json
  def create
    @sign = Sign.new(params[:sign])
    @location = Location.find(@sign.location_id)

    respond_to do |format|
      if @sign.save
        format.html { redirect_to location_index_path(@location.name.downcase), notice: 'Sign was successfully created.' }
        format.json { render json: @sign, status: :created, location: @sign }
      else
        format.html { render action: "new" }
        format.json { render json: @sign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /signs/1
  # PUT /signs/1.json
  def update
    @sign = Sign.find(params[:id])
    @location = Location.find(@sign.location_id)

    respond_to do |format|
      if @sign.update_attributes(params[:sign])
        format.html { redirect_to location_index_path(@location.name.downcase), notice: 'Sign was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sign.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_qty
    @sign = Sign.find(params[:id])
    @location = Location.find(@sign.location_id)
    qty = params[:update_qty]

    respond_to do |format|
      if @sign.update_quantity(params[:update_qty].to_i)
        format.html {redirect_to location_index_path(@location.name.downcase), notice: "Quantity updated by #{qty}"}
        format.js
      else
        format.html {edirect_to location_index_path(@location.name.downcase), notice: "Quantity update failed: An error has occurred."}
      end 
    end
  end    

  end

  # DELETE /signs/1
  # DELETE /signs/1.json
  def destroy
    @sign = Sign.find(params[:id])
    @location = Location.find(@sign.location_id)
    @sign.destroy

    respond_to do |format|
      format.html { redirect_to location_index_path(@location.name.downcase) }
      format.json { head :no_content }
    end
  end
