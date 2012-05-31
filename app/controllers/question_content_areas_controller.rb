class QuestionContentAreasController < ApplicationController
  # GET /question_content_areas
  # GET /question_content_areas.json
  def index
    @question_content_areas = QuestionContentArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @question_content_areas }
    end
  end

  # GET /question_content_areas/1
  # GET /question_content_areas/1.json
  def show
    @question_content_area = QuestionContentArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question_content_area }
    end
  end

  # GET /question_content_areas/new
  # GET /question_content_areas/new.json
  def new
    @question_content_area = QuestionContentArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question_content_area }
    end
  end

  # GET /question_content_areas/1/edit
  def edit
    @question_content_area = QuestionContentArea.find(params[:id])
  end

  # POST /question_content_areas
  # POST /question_content_areas.json
  def create
    @question_content_area = QuestionContentArea.new(params[:question_content_area])

    respond_to do |format|
      if @question_content_area.save
        format.html { redirect_to @question_content_area, notice: 'Question content area was successfully created.' }
        format.json { render json: @question_content_area, status: :created, location: @question_content_area }
      else
        format.html { render action: "new" }
        format.json { render json: @question_content_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /question_content_areas/1
  # PUT /question_content_areas/1.json
  def update
    @question_content_area = QuestionContentArea.find(params[:id])

    respond_to do |format|
      if @question_content_area.update_attributes(params[:question_content_area])
        format.html { redirect_to @question_content_area, notice: 'Question content area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question_content_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_content_areas/1
  # DELETE /question_content_areas/1.json
  def destroy
    @question_content_area = QuestionContentArea.find(params[:id])
    @question_content_area.destroy

    respond_to do |format|
      format.html { redirect_to question_content_areas_url }
      format.json { head :no_content }
    end
  end
end
