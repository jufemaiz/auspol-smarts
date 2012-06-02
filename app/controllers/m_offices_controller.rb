class MOfficesController < ApplicationController
  # GET /m_offices
  # GET /m_offices.json
  def index
    @m_offices = MOffice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @m_offices }
    end
  end

  # GET /m_offices/1
  # GET /m_offices/1.json
  def show
    @m_office = MOffice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @m_office }
    end
  end

  # GET /m_offices/new
  # GET /m_offices/new.json
  def new
    @m_office = MOffice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @m_office }
    end
  end

  # GET /m_offices/1/edit
  def edit
    @m_office = MOffice.find(params[:id])
  end

  # POST /m_offices
  # POST /m_offices.json
  def create
    @m_office = MOffice.new(params[:m_office])

    respond_to do |format|
      if @m_office.save
        format.html { redirect_to @m_office, notice: 'M office was successfully created.' }
        format.json { render json: @m_office, status: :created, location: @m_office }
      else
        format.html { render action: "new" }
        format.json { render json: @m_office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /m_offices/1
  # PUT /m_offices/1.json
  def update
    @m_office = MOffice.find(params[:id])

    respond_to do |format|
      if @m_office.update_attributes(params[:m_office])
        format.html { redirect_to @m_office, notice: 'M office was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @m_office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /m_offices/1
  # DELETE /m_offices/1.json
  def destroy
    @m_office = MOffice.find(params[:id])
    @m_office.destroy

    respond_to do |format|
      format.html { redirect_to m_offices_url }
      format.json { head :no_content }
    end
  end
end
