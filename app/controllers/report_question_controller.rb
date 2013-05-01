class ReportQuestionController < ApplicationController
  # GET /report_question
  # GET /report_question.json
  def index
    @report_question = ReportQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @report_question }
    end
  end

  # GET /report_question/1
  # GET /report_question/1.json
  def show
    @report_question = ReportQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report_question }
    end
  end

  # GET /report_question/new
  # GET /report_question/new.json
  def new
    @report_question = ReportQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report_question }
    end
  end

  # GET /report_question/1/edit
  def edit
    @report_question = ReportQuestion.find(params[:id])
  end

  # POST /report_question
  # POST /report_question.json
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
