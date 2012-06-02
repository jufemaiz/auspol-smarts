class HansardsController < ApplicationController
  # GET /hansards
  # GET /hansards.json
  def index
    @hansards = Hansard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hansards }
    end
  end

  # GET /hansards/1
  # GET /hansards/1.json
  def show
    @hansard = Hansard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hansard }
    end
  end

  # GET /hansards/new
  # GET /hansards/new.json
  def new
    @hansard = Hansard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hansard }
    end
  end

  # GET /hansards/1/edit
  def edit
    @hansard = Hansard.find(params[:id])
  end

  # POST /hansards
  # POST /hansards.json
  def create
    @hansard = Hansard.new(params[:hansard])

    respond_to do |format|
      if @hansard.save
        format.html { redirect_to @hansard, notice: 'Hansard was successfully created.' }
        format.json { render json: @hansard, status: :created, location: @hansard }
      else
        format.html { render action: "new" }
        format.json { render json: @hansard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hansards/1
  # PUT /hansards/1.json
  def update
    @hansard = Hansard.find(params[:id])

    respond_to do |format|
      if @hansard.update_attributes(params[:hansard])
        format.html { redirect_to @hansard, notice: 'Hansard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hansard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hansards/1
  # DELETE /hansards/1.json
  def destroy
    @hansard = Hansard.find(params[:id])
    @hansard.destroy

    respond_to do |format|
      format.html { redirect_to hansards_url }
      format.json { head :no_content }
    end
  end
end
