class ExamCategoriesController < ApplicationController
  # GET /exam_categories
  # GET /exam_categories.json
  def index
    @exam_categories = ExamCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exam_categories }
    end
  end

  # GET /exam_categories/1
  # GET /exam_categories/1.json
  def show
    @exam_category = ExamCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam_category }
    end
  end

  # GET /exam_categories/new
  # GET /exam_categories/new.json
  def new
    @exam_category = ExamCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam_category }
    end
  end

  # GET /exam_categories/1/edit
  def edit
    @exam_category = ExamCategory.find(params[:id])
  end

  # POST /exam_categories
  # POST /exam_categories.json
  def create
    @exam_category = ExamCategory.new(params[:exam_category])

    respond_to do |format|
      if @exam_category.save
        format.html { redirect_to @exam_category, notice: 'Exam category was successfully created.' }
        format.json { render json: @exam_category, status: :created, location: @exam_category }
      else
        format.html { render action: "new" }
        format.json { render json: @exam_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exam_categories/1
  # PUT /exam_categories/1.json
  def update
    @exam_category = ExamCategory.find(params[:id])

    respond_to do |format|
      if @exam_category.update_attributes(params[:exam_category])
        format.html { redirect_to @exam_category, notice: 'Exam category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_categories/1
  # DELETE /exam_categories/1.json
  def destroy
    @exam_category = ExamCategory.find(params[:id])
    @exam_category.destroy

    respond_to do |format|
      format.html { redirect_to exam_categories_url }
      format.json { head :no_content }
    end
  end
end
