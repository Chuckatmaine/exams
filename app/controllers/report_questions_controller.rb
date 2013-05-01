class ReportQuestionsController < ApplicationController
  # GET /report_questions
  # GET /report_questions.json
  def index
    @report_questions = ReportQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @report_questions }
    end
  end

  # GET /report_questions/1
  # GET /report_questions/1.json
  def show
    @report_question = ReportQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report_question }
    end
  end

  # GET /report_questions/new
  # GET /report_questions/new.json
  def new
    @report_question = ReportQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report_question }
    end
  end

  # GET /report_questions/1/edit
  def edit
    @report_question = ReportQuestion.find(params[:id])
  end

  # POST /report_questions
  # POST /report_questions.json
  def create
    @report_question = ReportQuestion.new(params[:report_question])

    respond_to do |format|
      if @report_question.save
        format.html { redirect_to @report_question, notice: 'Report question was successfully created.' }
        format.json { render json: @report_question, status: :created, location: @report_question }
      else
        format.html { render action: "new" }
        format.json { render json: @report_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /report_questions/1
  # PUT /report_questions/1.json
  def update
    @report_question = ReportQuestion.find(params[:id])

    respond_to do |format|
      if @report_question.update_attributes(params[:report_question])
        format.html { redirect_to @report_question, notice: 'Report question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_questions/1
  # DELETE /report_questions/1.json
  def destroy
    @report_question = ReportQuestion.find(params[:id])
    @report_question.destroy

    respond_to do |format|
      format.html { redirect_to report_questions_url }
      format.json { head :no_content }
    end
  end
end
