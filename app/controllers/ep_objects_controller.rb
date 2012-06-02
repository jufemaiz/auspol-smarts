class EpObjectsController < ApplicationController
  # GET /ep_objects
  # GET /ep_objects.json
  def index
    @ep_objects = EpObject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ep_objects }
    end
  end

  # GET /ep_objects/1
  # GET /ep_objects/1.json
  def show
    @ep_object = EpObject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ep_object }
    end
  end

  # GET /ep_objects/new
  # GET /ep_objects/new.json
  def new
    @ep_object = EpObject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ep_object }
    end
  end

  # GET /ep_objects/1/edit
  def edit
    @ep_object = EpObject.find(params[:id])
  end

  # POST /ep_objects
  # POST /ep_objects.json
  def create
    @ep_object = EpObject.new(params[:ep_object])

    respond_to do |format|
      if @ep_object.save
        format.html { redirect_to @ep_object, notice: 'Ep object was successfully created.' }
        format.json { render json: @ep_object, status: :created, location: @ep_object }
      else
        format.html { render action: "new" }
        format.json { render json: @ep_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ep_objects/1
  # PUT /ep_objects/1.json
  def update
    @ep_object = EpObject.find(params[:id])

    respond_to do |format|
      if @ep_object.update_attributes(params[:ep_object])
        format.html { redirect_to @ep_object, notice: 'Ep object was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ep_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ep_objects/1
  # DELETE /ep_objects/1.json
  def destroy
    @ep_object = EpObject.find(params[:id])
    @ep_object.destroy

    respond_to do |format|
      format.html { redirect_to ep_objects_url }
      format.json { head :no_content }
    end
  end
end
