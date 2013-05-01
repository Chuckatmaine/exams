class ReportsController < ApplicationController
  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end
  def examlist 
    @reports = Report.all
    @exams = Exam.all
    UserSubmit.delete_all("user_answers_count < 1")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @report = Report.new
    @report.report_questions.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/1/edit
  def edit
    @report = Report.find(params[:id])
  end
  def run
    @report = Report.new(params[:report])
    #@report.report_questions.build
    @report.exam = Exam.find(params[:id])
    #allgrades 
    @report.rundate = Time.zone.now
    @report.creator = current_user
    @report.department = @report.creator.department
    @report.generate
    logger.debug "\n\n *** \n\n Report User " + @report.inspect + " ********* \n"
    respond_to do |format|
      if @report.save
        flash[:notice] = 'Report was successfully generated.' 
        format.html # show.html.erb
      else
        format.json { render json: @report.errors, status: :unprocessable_entity }
        format.html { render action: "show", notice: 'Report was not updated.'  }
      end
    end
  end

  def allgrades
    @report = Report.new(params[:report])
    @exam = Exam.find(params[:id])
    @eq = @exam.questions.all
    @users_submit = UserSubmit.includes(:user_answers, :question_answers).find(:all, :conditions =>{:exam_id => @exam.id})
    @users_submit.each do |us|
#     logger.debug "\n\n *** \n\n User submit. \n\n" + @users_submit.inspect + "\n\n ********* \n"
      if @users_submit.empty?
       flash[:notice] = "No one has yet taken exam: " + @exam.title
       redirect_to :back
      else
        respond_to do |format|
          format.html # allgrades.html.erb
          format.json { render json: @exam }
        end
        return
      end
    end
  end


  def mygrade
    @report = Report.new(params[:report])
    @exam = Exam.find(params[:id])
    @user_submit = UserSubmit.includes(:user_answers, :question_answers).find(:last, :conditions =>{:user_id => current_user.id, :exam_id => @exam.id, :locked => true})
    if @user_submit.nil?
     flash[:notice] = "You have not yet taken this exam."
     redirect_to :back
    else
     submit = @user_submit
     unless @grade = submit.grade
       @grade = @report.calc_grade(submit)
     end
     respond_to do |format|
      format.html # mygrade.html.erb
      format.json { render json: @exam }
    end
    end
  end


  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(params[:report])
    @report.exam = Exam.find(params[:id])
    @report.rundate = Time.zone.now
    @report.user = current_user

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.json
  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end
end
