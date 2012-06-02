class ConsInfoController < ApplicationController
  # GET /cons_info
  # GET /cons_info.json
  def index
    @cons_info = ConsInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cons_info }
    end
  end

  # GET /cons_info/1
  # GET /cons_info/1.json
  def show
    @cons_info = ConsInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cons_info }
    end
  end

  # GET /cons_info/new
  # GET /cons_info/new.json
  def new
    @cons_info = ConsInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cons_info }
    end
  end

  # GET /cons_info/1/edit
  def edit
    @cons_info = ConsInfo.find(params[:id])
  end

  # POST /cons_info
  # POST /cons_info.json
  def create
    @cons_info = ConsInfo.new(params[:cons_info])

    respond_to do |format|
      if @cons_info.save
        format.html { redirect_to @cons_info, notice: 'Cons info was successfully created.' }
        format.json { render json: @cons_info, status: :created, location: @cons_info }
      else
        format.html { render action: "new" }
        format.json { render json: @cons_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cons_info/1
  # PUT /cons_info/1.json
  def update
    @cons_info = ConsInfo.find(params[:id])

    respond_to do |format|
      if @cons_info.update_attributes(params[:cons_info])
        format.html { redirect_to @cons_info, notice: 'Cons info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cons_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cons_info/1
  # DELETE /cons_info/1.json
  def destroy
    @cons_info = ConsInfo.find(params[:id])
    @cons_info.destroy

    respond_to do |format|
      format.html { redirect_to cons_info_url }
      format.json { head :no_content }
    end
  end
end
