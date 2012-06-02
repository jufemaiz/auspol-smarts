class PbcMembersController < ApplicationController
  # GET /pbc_members
  # GET /pbc_members.json
  def index
    @pbc_members = PbcMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pbc_members }
    end
  end

  # GET /pbc_members/1
  # GET /pbc_members/1.json
  def show
    @pbc_member = PbcMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pbc_member }
    end
  end

  # GET /pbc_members/new
  # GET /pbc_members/new.json
  def new
    @pbc_member = PbcMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pbc_member }
    end
  end

  # GET /pbc_members/1/edit
  def edit
    @pbc_member = PbcMember.find(params[:id])
  end

  # POST /pbc_members
  # POST /pbc_members.json
  def create
    @pbc_member = PbcMember.new(params[:pbc_member])

    respond_to do |format|
      if @pbc_member.save
        format.html { redirect_to @pbc_member, notice: 'Pbc member was successfully created.' }
        format.json { render json: @pbc_member, status: :created, location: @pbc_member }
      else
        format.html { render action: "new" }
        format.json { render json: @pbc_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pbc_members/1
  # PUT /pbc_members/1.json
  def update
    @pbc_member = PbcMember.find(params[:id])

    respond_to do |format|
      if @pbc_member.update_attributes(params[:pbc_member])
        format.html { redirect_to @pbc_member, notice: 'Pbc member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pbc_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pbc_members/1
  # DELETE /pbc_members/1.json
  def destroy
    @pbc_member = PbcMember.find(params[:id])
    @pbc_member.destroy

    respond_to do |format|
      format.html { redirect_to pbc_members_url }
      format.json { head :no_content }
    end
  end
end
