class ElectoratesController < ApplicationController
  # GET /electorates
  # GET /electorates.json
  def index
    @electorates = Electorate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @electorates }
    end
  end

  # GET /electorates/1
  # GET /electorates/1.json
  def show
    @electorate = Electorate.find_by_title(params[:id])
    @members = Member.find_all_by_constituency(@electorate.title)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @electorate }
    end
  end

  # GET /electorates/new
  # GET /electorates/new.json
  def new
    @electorate = Electorate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @electorate }
    end
  end

  # GET /electorates/1/edit
  def edit
    @electorate = Electorate.find(params[:id])
  end

  # POST /electorates
  # POST /electorates.json
  def create
    @electorate = Electorate.new(params[:electorate])

    respond_to do |format|
      if @electorate.save
        format.html { redirect_to @electorate, notice: 'Electorate was successfully created.' }
        format.json { render json: @electorate, status: :created, location: @electorate }
      else
        format.html { render action: "new" }
        format.json { render json: @electorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /electorates/1
  # PUT /electorates/1.json
  def update
    @electorate = Electorate.find(params[:id])

    respond_to do |format|
      if @electorate.update_attributes(params[:electorate])
        format.html { redirect_to @electorate, notice: 'Electorate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @electorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /electorates/1
  # DELETE /electorates/1.json
  def destroy
    @electorate = Electorate.find(params[:id])
    @electorate.destroy

    respond_to do |format|
      format.html { redirect_to electorates_url }
      format.json { head :no_content }
    end
  end
end
