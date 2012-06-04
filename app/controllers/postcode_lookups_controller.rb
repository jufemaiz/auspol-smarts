class PostcodeLookupsController < ApplicationController
  # GET /postcode_lookups
  # GET /postcode_lookups.json
  def index
    @postcode_lookup = nil
    
    if params[:q]
      if params[:q].match(/^\d{4}$/)
        @postcode_lookup = PostcodeLookup.find_all_by_postcode(params[:q]).count
      end
    end
    
    respond_to do |format|
      if !@postcode_lookup.nil? && @postcode_lookup > 0
        format.html { redirect_to postcode_path(params[:q]) }
      elsif !params[:q].nil?
        format.html { redirect_to postcodes_path, notice: 'Postcode is not correct format.' }
      else
        format.html # index.html.erb
        # format.json { render json: @postcode_lookups }
      end
    end

  end

  # GET /postcode_lookups/1
  # GET /postcode_lookups/1.json
  def show
    @postcodes = PostcodeLookup.find_all_by_postcode(params[:id])
    logger.debug(@postcodes)

    respond_to do |format|
      if @postcodes.length == 0
        format.html { redirect_to postcodes_path, notice: 'No postcodes registered.' }
        format.json { render json: @postcodes }
      elsif @postcodes.length > 1
        format.html
        format.json { render json: @postcodes }
      else
        format.html { redirect_to electorate_path(@postcodes.first["name"]) }
        format.json { render json: @postcodes }
      end
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
