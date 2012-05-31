class ContentAreasController < ApplicationController
  # GET /content_areas
  # GET /content_areas.json
  def index
    @content_areas = ContentArea.where :department_id => current_user.department_id

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @content_areas }
    end
  end

  # GET /content_areas/1
  # GET /content_areas/1.json
  def show
    @content_area = ContentArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content_area }
    end
  end

  # GET /content_areas/new
  # GET /content_areas/new.json
  def new
    @content_area = ContentArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_area }
    end
  end

  # GET /content_areas/1/edit
  def edit
    @content_area = ContentArea.find(params[:id])
  end

  # POST /content_areas
  # POST /content_areas.json
  def create
    @content_area = ContentArea.new(params[:content_area])
    @content_area.department_id = current_user.department_id
    @content_area.creator_id = current_user
 
    respond_to do |format|
      if @content_area.save
        format.html { redirect_to content_areas_url, notice: 'Content area was successfully created.' }
        format.json { render json: @content_area, status: :created, location: @content_area }
      else
        format.html { render action: "new" }
        format.json { render json: @content_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /content_areas/1
  # PUT /content_areas/1.json
  def update
    @content_area = ContentArea.find(params[:id])

    respond_to do |format|
      if @content_area.update_attributes(params[:content_area])
        format.html { redirect_to @content_area, notice: 'Content area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_areas/1
  # DELETE /content_areas/1.json
  def destroy
    @content_area = ContentArea.find(params[:id])
    @content_area.destroy

    respond_to do |format|
      format.html { redirect_to content_areas_url }
      format.json { head :no_content }
    end
  end
end
