class RailsController < ApplicationController
  # GET /rails
  # GET /rails.json
  def index
    @rails = Rail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rails }
    end
  end

  # GET /rails/1
  # GET /rails/1.json
  def show
    @rail = Rail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rail }
    end
  end

  # GET /rails/new
  # GET /rails/new.json
  def new
    @rail = Rail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rail }
    end
  end

  # GET /rails/1/edit
  def edit
    @rail = Rail.find(params[:id])
  end

  # POST /rails
  # POST /rails.json
  def create
    @rail = Rail.new(params[:rail])

    respond_to do |format|
      if @rail.save
        format.html { redirect_to @rail, notice: 'Rail was successfully created.' }
        format.json { render json: @rail, status: :created, location: @rail }
      else
        format.html { render action: "new" }
        format.json { render json: @rail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rails/1
  # PUT /rails/1.json
  def update
    @rail = Rail.find(params[:id])

    respond_to do |format|
      if @rail.update_attributes(params[:rail])
        format.html { redirect_to @rail, notice: 'Rail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rails/1
  # DELETE /rails/1.json
  def destroy
    @rail = Rail.find(params[:id])
    @rail.destroy

    respond_to do |format|
      format.html { redirect_to rails_url }
      format.json { head :no_content }
    end
  end
end
