class PostcodeLookupsController < ApplicationController
  # GET /postcode_lookups
  # GET /postcode_lookups.json
  def index
    @postcode_lookups = PostcodeLookup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @postcode_lookups }
    end
  end

  # GET /postcode_lookups/1
  # GET /postcode_lookups/1.json
  def show
    @postcode_lookup = PostcodeLookup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @postcode_lookup }
    end
  end

  # GET /postcode_lookups/new
  # GET /postcode_lookups/new.json
  def new
    @postcode_lookup = PostcodeLookup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @postcode_lookup }
    end
  end

  # GET /postcode_lookups/1/edit
  def edit
    @postcode_lookup = PostcodeLookup.find(params[:id])
  end

  # POST /postcode_lookups
  # POST /postcode_lookups.json
  def create
    @postcode_lookup = PostcodeLookup.new(params[:postcode_lookup])

    respond_to do |format|
      if @postcode_lookup.save
        format.html { redirect_to @postcode_lookup, notice: 'Postcode lookup was successfully created.' }
        format.json { render json: @postcode_lookup, status: :created, location: @postcode_lookup }
      else
        format.html { render action: "new" }
        format.json { render json: @postcode_lookup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /postcode_lookups/1
  # PUT /postcode_lookups/1.json
  def update
    @postcode_lookup = PostcodeLookup.find(params[:id])

    respond_to do |format|
      if @postcode_lookup.update_attributes(params[:postcode_lookup])
        format.html { redirect_to @postcode_lookup, notice: 'Postcode lookup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @postcode_lookup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postcode_lookups/1
  # DELETE /postcode_lookups/1.json
  def destroy
    @postcode_lookup = PostcodeLookup.find(params[:id])
    @postcode_lookup.destroy

    respond_to do |format|
      format.html { redirect_to postcode_lookups_url }
      format.json { head :no_content }
    end
  end
end
