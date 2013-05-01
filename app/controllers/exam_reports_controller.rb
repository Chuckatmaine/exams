class ExamReportsController < ApplicationController
  # GET /exam_reports
  # GET /exam_reports.json
  def index
    @exam_reports = ExamReport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exam_reports }
    end
  end

  # GET /exam_reports/1
  # GET /exam_reports/1.json
  def show
    @exam_report = ExamReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam_report }
    end
  end

  # GET /exam_reports/new
  # GET /exam_reports/new.json
  def new
    @exam_report = ExamReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam_report }
    end
  end

  # GET /exam_reports/1/edit
  def edit
    @exam_report = ExamReport.find(params[:id])
  end

  # POST /exam_reports
  # POST /exam_reports.json
  def create
    @exam_report = ExamReport.new(params[:exam_report])

    respond_to do |format|
      if @exam_report.save
        format.html { redirect_to @exam_report, notice: 'Exam report was successfully created.' }
        format.json { render json: @exam_report, status: :created, location: @exam_report }
      else
        format.html { render action: "new" }
        format.json { render json: @exam_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exam_reports/1
  # PUT /exam_reports/1.json
  def update
    @exam_report = ExamReport.find(params[:id])

    respond_to do |format|
      if @exam_report.update_attributes(params[:exam_report])
        format.html { redirect_to @exam_report, notice: 'Exam report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_reports/1
  # DELETE /exam_reports/1.json
  def destroy
    @exam_report = ExamReport.find(params[:id])
    @exam_report.destroy

    respond_to do |format|
      format.html { redirect_to exam_reports_url }
      format.json { head :no_content }
    end
  end
end
