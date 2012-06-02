class PersonInfosController < ApplicationController
  # GET /person_infos
  # GET /person_infos.json
  def index
    @person_infos = PersonInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @person_infos }
    end
  end

  # GET /person_infos/1
  # GET /person_infos/1.json
  def show
    @person_info = PersonInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person_info }
    end
  end

  # GET /person_infos/new
  # GET /person_infos/new.json
  def new
    @person_info = PersonInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person_info }
    end
  end

  # GET /person_infos/1/edit
  def edit
    @person_info = PersonInfo.find(params[:id])
  end

  # POST /person_infos
  # POST /person_infos.json
  def create
    @person_info = PersonInfo.new(params[:person_info])

    respond_to do |format|
      if @person_info.save
        format.html { redirect_to @person_info, notice: 'Person info was successfully created.' }
        format.json { render json: @person_info, status: :created, location: @person_info }
      else
        format.html { render action: "new" }
        format.json { render json: @person_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /person_infos/1
  # PUT /person_infos/1.json
  def update
    @person_info = PersonInfo.find(params[:id])

    respond_to do |format|
      if @person_info.update_attributes(params[:person_info])
        format.html { redirect_to @person_info, notice: 'Person info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_infos/1
  # DELETE /person_infos/1.json
  def destroy
    @person_info = PersonInfo.find(params[:id])
    @person_info.destroy

    respond_to do |format|
      format.html { redirect_to person_infos_url }
      format.json { head :no_content }
    end
  end
end
