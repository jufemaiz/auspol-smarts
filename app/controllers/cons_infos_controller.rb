class ConsInfosController < ApplicationController
  # GET /cons_infos
  # GET /cons_infos.json
  def index
    @cons_infos = ConsInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cons_infos }
    end
  end

  # GET /cons_infos/1
  # GET /cons_infos/1.json
  def show
    @cons_info = ConsInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cons_info }
    end
  end

  # GET /cons_infos/new
  # GET /cons_infos/new.json
  def new
    @cons_info = ConsInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cons_info }
    end
  end

  # GET /cons_infos/1/edit
  def edit
    @cons_info = ConsInfo.find(params[:id])
  end

  # POST /cons_infos
  # POST /cons_infos.json
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

  # PUT /cons_infos/1
  # PUT /cons_infos/1.json
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

  # DELETE /cons_infos/1
  # DELETE /cons_infos/1.json
  def destroy
    @cons_info = ConsInfo.find(params[:id])
    @cons_info.destroy

    respond_to do |format|
      format.html { redirect_to cons_infos_url }
      format.json { head :no_content }
    end
  end
end
