class ExamQuestionsController < ApplicationController
  # GET /exam_questions
  # GET /exam_questions.json
  def index
    @exam_questions = ExamQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exam_questions }
    end
  end

  # GET /exam_questions/1
  # GET /exam_questions/1.json
  def show
    @exam_question = ExamQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam_question }
    end
  end

  # GET /exam_questions/new
  # GET /exam_questions/new.json
  def new
    @exam_question = ExamQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam_question }
    end
  end

  # GET /exam_questions/1/edit
  def edit
    @exam_question = ExamQuestion.find(params[:id])
  end

  # POST /exam_questions
  # POST /exam_questions.json
  def create
    @exam_question = ExamQuestion.new(params[:exam_question])

    respond_to do |format|
      if @exam_question.save
        format.html { redirect_to @exam_question, notice: 'Exam question was successfully created.' }
        format.json { render json: @exam_question, status: :created, location: @exam_question }
      else
        format.html { render action: "new" }
        format.json { render json: @exam_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exam_questions/1
  # PUT /exam_questions/1.json
  def update
    @exam_question = ExamQuestion.find(params[:id])

    respond_to do |format|
      if @exam_question.update_attributes(params[:exam_question])
        format.html { redirect_to @exam_question, notice: 'Exam question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_questions/1
  # DELETE /exam_questions/1.json
  def destroy
    @exam_question = ExamQuestion.find(params[:id])
    @exam_question.destroy

    respond_to do |format|
      format.html { redirect_to exam_questions_url }
      format.json { head :no_content }
    end
  end
end
