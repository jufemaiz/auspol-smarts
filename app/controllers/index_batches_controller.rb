class IndexBatchesController < ApplicationController
  # GET /index_batches
  # GET /index_batches.json
  def index
    @index_batches = IndexBatch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @index_batches }
    end
  end

  # GET /index_batches/1
  # GET /index_batches/1.json
  def show
    @index_batch = IndexBatch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @index_batch }
    end
  end

  # GET /index_batches/new
  # GET /index_batches/new.json
  def new
    @index_batch = IndexBatch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @index_batch }
    end
  end

  # GET /index_batches/1/edit
  def edit
    @index_batch = IndexBatch.find(params[:id])
  end

  # POST /index_batches
  # POST /index_batches.json
  def create
    @index_batch = IndexBatch.new(params[:index_batch])

    respond_to do |format|
      if @index_batch.save
        format.html { redirect_to @index_batch, notice: 'Index batch was successfully created.' }
        format.json { render json: @index_batch, status: :created, location: @index_batch }
      else
        format.html { render action: "new" }
        format.json { render json: @index_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /index_batches/1
  # PUT /index_batches/1.json
  def update
    @index_batch = IndexBatch.find(params[:id])

    respond_to do |format|
      if @index_batch.update_attributes(params[:index_batch])
        format.html { redirect_to @index_batch, notice: 'Index batch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @index_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /index_batches/1
  # DELETE /index_batches/1.json
  def destroy
    @index_batch = IndexBatch.find(params[:id])
    @index_batch.destroy

    respond_to do |format|
      format.html { redirect_to index_batches_url }
      format.json { head :no_content }
    end
  end
end
