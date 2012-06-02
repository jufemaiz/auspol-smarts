class MemberInfosController < ApplicationController
  # GET /member_infos
  # GET /member_infos.json
  def index
    @member_infos = MemberInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @member_infos }
    end
  end

  # GET /member_infos/1
  # GET /member_infos/1.json
  def show
    @member_info = MemberInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member_info }
    end
  end

  # GET /member_infos/new
  # GET /member_infos/new.json
  def new
    @member_info = MemberInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member_info }
    end
  end

  # GET /member_infos/1/edit
  def edit
    @member_info = MemberInfo.find(params[:id])
  end

  # POST /member_infos
  # POST /member_infos.json
  def create
    @member_info = MemberInfo.new(params[:member_info])

    respond_to do |format|
      if @member_info.save
        format.html { redirect_to @member_info, notice: 'Member info was successfully created.' }
        format.json { render json: @member_info, status: :created, location: @member_info }
      else
        format.html { render action: "new" }
        format.json { render json: @member_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /member_infos/1
  # PUT /member_infos/1.json
  def update
    @member_info = MemberInfo.find(params[:id])

    respond_to do |format|
      if @member_info.update_attributes(params[:member_info])
        format.html { redirect_to @member_info, notice: 'Member info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_infos/1
  # DELETE /member_infos/1.json
  def destroy
    @member_info = MemberInfo.find(params[:id])
    @member_info.destroy

    respond_to do |format|
      format.html { redirect_to member_infos_url }
      format.json { head :no_content }
    end
  end
end
