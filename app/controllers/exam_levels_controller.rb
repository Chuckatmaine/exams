class ExamLevelsController < ApplicationController
  # GET /exam_levels
  # GET /exam_levels.json
  def index
    @exam_levels = ExamLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exam_levels }
    end
  end

  # GET /exam_levels/1
  # GET /exam_levels/1.json
  def show
    @exam_level = ExamLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam_level }
    end
  end

  # GET /exam_levels/new
  # GET /exam_levels/new.json
  def new
    @exam_level = ExamLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam_level }
    end
  end

  # GET /exam_levels/1/edit
  def edit
    @exam_level = ExamLevel.find(params[:id])
  end

  # POST /exam_levels
  # POST /exam_levels.json
  def create
    @exam_level = ExamLevel.new(params[:exam_level])

    respond_to do |format|
      if @exam_level.save
        format.html { redirect_to @exam_level, notice: 'Exam level was successfully created.' }
        format.json { render json: @exam_level, status: :created, location: @exam_level }
      else
        format.html { render action: "new" }
        format.json { render json: @exam_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exam_levels/1
  # PUT /exam_levels/1.json
  def update
    @exam_level = ExamLevel.find(params[:id])

    respond_to do |format|
      if @exam_level.update_attributes(params[:exam_level])
        format.html { redirect_to @exam_level, notice: 'Exam level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_levels/1
  # DELETE /exam_levels/1.json
  def destroy
    @exam_level = ExamLevel.find(params[:id])
    @exam_level.destroy

    respond_to do |format|
      format.html { redirect_to exam_levels_url }
      format.json { head :no_content }
    end
  end
end
