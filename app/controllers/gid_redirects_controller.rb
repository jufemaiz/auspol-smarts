class GidRedirectsController < ApplicationController
  # GET /gid_redirects
  # GET /gid_redirects.json
  def index
    @gid_redirects = GidRedirect.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gid_redirects }
    end
  end

  # GET /gid_redirects/1
  # GET /gid_redirects/1.json
  def show
    @gid_redirect = GidRedirect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gid_redirect }
    end
  end

  # GET /gid_redirects/new
  # GET /gid_redirects/new.json
  def new
    @gid_redirect = GidRedirect.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gid_redirect }
    end
  end

  # GET /gid_redirects/1/edit
  def edit
    @gid_redirect = GidRedirect.find(params[:id])
  end

  # POST /gid_redirects
  # POST /gid_redirects.json
  def create
    @gid_redirect = GidRedirect.new(params[:gid_redirect])

    respond_to do |format|
      if @gid_redirect.save
        format.html { redirect_to @gid_redirect, notice: 'Gid redirect was successfully created.' }
        format.json { render json: @gid_redirect, status: :created, location: @gid_redirect }
      else
        format.html { render action: "new" }
        format.json { render json: @gid_redirect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gid_redirects/1
  # PUT /gid_redirects/1.json
  def update
    @gid_redirect = GidRedirect.find(params[:id])

    respond_to do |format|
      if @gid_redirect.update_attributes(params[:gid_redirect])
        format.html { redirect_to @gid_redirect, notice: 'Gid redirect was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gid_redirect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gid_redirects/1
  # DELETE /gid_redirects/1.json
  def destroy
    @gid_redirect = GidRedirect.find(params[:id])
    @gid_redirect.destroy

    respond_to do |format|
      format.html { redirect_to gid_redirects_url }
      format.json { head :no_content }
    end
  end
end
