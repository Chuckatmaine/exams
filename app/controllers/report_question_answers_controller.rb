class ReportQuestionAnswersController < ApplicationController
  # GET /report_question_answers
  # GET /report_question_answers.json
  def index
    @report_question_answers = ReportQuestionAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @report_question_answers }
    end
  end

  # GET /report_question_answers/1
  # GET /report_question_answers/1.json
  def show
    @report_question_answer = ReportQuestionAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report_question_answer }
    end
  end

  # GET /report_question_answers/new
  # GET /report_question_answers/new.json
  def new
    @report_question_answer = ReportQuestionAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report_question_answer }
    end
  end

  # GET /report_question_answers/1/edit
  def edit
    @report_question_answer = ReportQuestionAnswer.find(params[:id])
  end

  # POST /report_question_answers
  # POST /report_question_answers.json
  def create
    @report_question_answer = ReportQuestionAnswer.new(params[:report_question_answer])

    respond_to do |format|
      if @report_question_answer.save
        format.html { redirect_to @report_question_answer, notice: 'Report question answer was successfully created.' }
        format.json { render json: @report_question_answer, status: :created, location: @report_question_answer }
      else
        format.html { render action: "new" }
        format.json { render json: @report_question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /report_question_answers/1
  # PUT /report_question_answers/1.json
  def update
    @report_question_answer = ReportQuestionAnswer.find(params[:id])

    respond_to do |format|
      if @report_question_answer.update_attributes(params[:report_question_answer])
        format.html { redirect_to @report_question_answer, notice: 'Report question answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report_question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_question_answers/1
  # DELETE /report_question_answers/1.json
  def destroy
    @report_question_answer = ReportQuestionAnswer.find(params[:id])
    @report_question_answer.destroy

    respond_to do |format|
      format.html { redirect_to report_question_answers_url }
      format.json { head :no_content }
    end
  end
end
