class ExamContentAreasController < ApplicationController
  # GET /exam_content_areas
  # GET /exam_content_areas.json
  def index
    @exam_content_areas = ExamContentArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exam_content_areas }
    end
  end

  # GET /exam_content_areas/1
  # GET /exam_content_areas/1.json
  def show
    @exam_content_area = ExamContentArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam_content_area }
    end
  end

  # GET /exam_content_areas/new
  # GET /exam_content_areas/new.json
  def new
    @exam_content_area = ExamContentArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam_content_area }
    end
  end

  # GET /exam_content_areas/1/edit
  def edit
    @exam_content_area = ExamContentArea.find(params[:id])
  end

  # POST /exam_content_areas
  # POST /exam_content_areas.json
  def create
    @exam_content_area = ExamContentArea.new(params[:exam_content_area])

    respond_to do |format|
      if @exam_content_area.save
        format.html { redirect_to @exam_content_area, notice: 'Exam content area was successfully created.' }
        format.json { render json: @exam_content_area, status: :created, location: @exam_content_area }
      else
        format.html { render action: "new" }
        format.json { render json: @exam_content_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exam_content_areas/1
  # PUT /exam_content_areas/1.json
  def update
    @exam_content_area = ExamContentArea.find(params[:id])

    respond_to do |format|
      if @exam_content_area.update_attributes(params[:exam_content_area])
        format.html { redirect_to @exam_content_area, notice: 'Exam content area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam_content_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_content_areas/1
  # DELETE /exam_content_areas/1.json
  def destroy
    @exam_content_area = ExamContentArea.find(params[:id])
    @exam_content_area.destroy

    respond_to do |format|
      format.html { redirect_to exam_content_areas_url }
      format.json { head :no_content }
    end
  end
end
