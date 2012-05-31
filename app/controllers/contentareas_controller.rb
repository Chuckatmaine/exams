class ContentareasController < ApplicationController
  # GET /contentareas
  # GET /contentareas.json
  def index
    @contentareas = Contentarea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contentareas }
    end
  end

  # GET /contentareas/1
  # GET /contentareas/1.json
  def show
    @contentarea = Contentarea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contentarea }
    end
  end

  # GET /contentareas/new
  # GET /contentareas/new.json
  def new
    @contentarea = Contentarea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contentarea }
    end
  end

  # GET /contentareas/1/edit
  def edit
    @contentarea = Contentarea.find(params[:id])
  end

  # POST /contentareas
  # POST /contentareas.json
  def create
    @contentarea = Contentarea.new(params[:contentarea])

    respond_to do |format|
      if @contentarea.save
        format.html { redirect_to @contentarea, notice: 'Contentarea was successfully created.' }
        format.json { render json: @contentarea, status: :created, location: @contentarea }
      else
        format.html { render action: "new" }
        format.json { render json: @contentarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contentareas/1
  # PUT /contentareas/1.json
  def update
    @contentarea = Contentarea.find(params[:id])

    respond_to do |format|
      if @contentarea.update_attributes(params[:contentarea])
        format.html { redirect_to @contentarea, notice: 'Contentarea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contentarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contentareas/1
  # DELETE /contentareas/1.json
  def destroy
    @contentarea = Contentarea.find(params[:id])
    @contentarea.destroy

    respond_to do |format|
      format.html { redirect_to contentareas_url }
      format.json { head :no_content }
    end
  end
end
