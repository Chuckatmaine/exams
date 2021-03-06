class ExamsController < ApplicationController
  # GET /exams
  # GET /exams.json
  skip_before_filter :require_user, :only => [:show]
  before_filter :require_faculty, :only => [:new, :edit, :show]
  before_filter :require_owner, :only => [:edit, :destroy]
  before_filter :require_unlocked, :only => [:edit, :destroy]
  before_filter :require_available, :only => [:take] # Locks the exam the first time someone begins taking it
  before_filter :already_taken, :only => [:take] # prevent user from re-taking / updating an exam they have already taken

  def index
    if current_user.admin || current_user.faculty
      @exams = Exam.find_all_by_department_id(current_user.department.id)
    else
      @exams = Exam.includes(:users).where("available = ? and start_date <= ? and end_date >= ?", true, Time.zone.now, Time.zone.now)
#    logger.debug "\n\n *** \n\n Exams in index " + @exams.inspect + " ********* \n"
    end
    UserSubmit.delete_all("user_answers_count < 1") # Clear all test takes not really started - click take then leave
#    logger.debug "\n\n *** \n\n Exams in index " + @exams.inspect + " ********* \n"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exams }
    end
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
    @exam = Exam.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam }
    end
  end

  # GET /exams/new
  # GET /exams/new.json
  def new
    @exam = Exam.new
    @courses = Course.find_all_by_department_id(current_user.department.id)
    @content_areas = ContentArea.find_all_by_department_id(current_user.department.id)
    @levels = Level.find_all_by_department_id(current_user.department.id)
    if @courses.count < 1 
       flash[:notice] = "You must create courses before creating exams."
       redirect_to :back 
       return 
    end
    if @content_areas.count < 1 
       flash[:notice] = "You must create content areas before creating exams."
       redirect_to :back 
       return 
    end
    if @levels.count < 1 
       flash[:notice] = "You must create learning levels before creating exams."
       redirect_to :back 
       return 
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam }
    end
  end
  # GET /exams/1/edit
  def edit
    @exam = Exam.find(params[:id])
    if current_user.admin
      @courses = Course.all
      @content_areas = ContentArea.all
      @levels = Level.all
    else
      @courses = Course.find_all_by_department_id(current_user.department.id)
      @content_areas = ContentArea.find_all_by_department_id(current_user.department.id)
      @levels = Level.find_all_by_department_id(current_user.department.id)
    end
  end

  # POST /exams
  # POST /exams.json
  def take
    @exam = Exam.includes(:questions, :answers).find(params[:id])
    @exam_start = Time.now
     
    if @user_submit = UserSubmit.includes(:user_answers).find(:first, :conditions =>{:user_id => current_user.id, :exam_id => @exam.id}) && !@exam.retake
      logger.debug "\n\n *** \n\n If . \n\n" + @user_submit.inspect + "\n\n ********* \n"
      @user_submit.take_count = UserSubmit.where(:user_id => current_user.id, :exam_id => @exam.id).count
      # @user_submit.user_answers = UserAnswer.where(:user_id => current_user, :question_answer_id => @exam.question_answer)
    else
      logger.debug "\n\n *** \n\n Else. \n\n" + @user_submit.inspect + "\n\n ********* \n"
      @user_submit = UserSubmit.new
      @user_submit.user = current_user    
      @user_submit.locked = 0
      @user_submit.exam = @exam
      @user_submit.take_count = UserSubmit.where(:user_id => current_user.id, :exam_id => @exam.id).where(:user_answers_count != 0  ).count
      @user_submit.increment!(:take_count)
      
    end
    @uahash = Hash.new
    @user_submit.user_answers.each do |ua|
    @uahash[ua.question_answer_id] = ua.id
    end

    @user_submit.save!
    @questions = @exam.questions.sort_by {rand() }
     respond_to do |format|
      format.html # take.html.erb
      format.json { render json: @exam }
    end
     @exam.calc_grade(@user_submit)
     @user_submit.save!
  end
  def create
    @exam = Exam.new(params[:exam])
    @courses = Course.find_all_by_department_id(current_user.department.id)
    @levels = Level.find_all_by_department_id(current_user.department.id)
    @content_areas = ContentArea.find_all_by_department_id(current_user.department.id)
    @exam.department_id = current_user.department_id
    @exam.creator = current_user
    @exam.show_results = 0
    flash[:notice] = @exam.generate
    respond_to do |format|
#      logger.debug "\n\n *** \n\n content after generate. \n\n" + flash.inspect + "\n\n ********* \n"
      if @exam.save!
        format.html { redirect_to @exam }
        format.json { render json: @exam, status: :created, location: @exam }
      else
        format.html { render action: "new" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exams/1
  # PUT /exams/1.json
  def update
    @exam = Exam.find(params[:id])
    @exam.cleanup
    @exam.department_id = current_user.department_id
    respond_to do |format|
      if @exam.update_attributes(params[:exam])
        flash[:notice] = @exam.generate
        format.html { redirect_to @exam }
        format.json { head :no_content }
#      logger.debug "\n\n *** \n\n content after generate. \n\n" + flash.inspect + "\n\n ********* \n"
      else
        format.html { render action: "edit" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end
 # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam = Exam.find(params[:id])
    @exam.delete
    respond_to do |format|
      format.html { redirect_to exams_url }
      format.json { head :no_content }
    end
  end
  def require_faculty
     unless (current_user.faculty) || (current_user.admin)
     flash[:notice] = "You must be a faculty member to create or edit exams." 
     redirect_to :back
     return(0)
     end
  end
  def require_owner
    @exam = Exam.find(params[:id])
     unless (current_user == @exam.creator) || (current_user.admin)
     flash[:notice] = "You must be the owner to modify this exam."
     redirect_to @exam
     end
  end
  def require_unlocked
    @exam = Exam.find(params[:id])
    taken_count = UserSubmit.where(:exam_id => @exam.id).count
    if @exam.locked  && taken_count > 0
      flash[:notice] = "Exam " + @exam.title + " has been administered and is therefore locked. It can no longer be edited or deleted."
      redirect_to :back 
      return(0)
    end
  end
  def require_available
    @exam = Exam.includes(:user_submits).find(params[:id])
    if @exam.available == false
      flash[:notice] = "Exam: " + @exam.title + "  is not available to take at this time."
      redirect_to :back  
      return(0)
    end
    now = Time.zone.now
    if  now < @exam.start_date || now > @exam.end_date
      flash[:notice] = "Exam " + @exam.title + " is only available from: " + @exam.start_date.to_s + " to: " + @exam.end_date.to_s + " Now: " + now.to_s
      redirect_to :back
      return(0)
    end
    @exam.locked = 1 # Lock the exam once someone begins taking the exam 
    @exam.save
  end
  def enable_retake
    @exam = Exam.find(params[:id])
    if @exam.retake
      @exam.retake = 0
      retake = "false"
    else
      @exam.retake = 1
      retake = "true"
    end
    if @exam.save
      flash[:notice] = "Exam " + @exam.title + " Retake is now set to: " + retake
      redirect_to :back
    end
  end
  def availability 
    @exam = Exam.find(params[:id])
    if @exam.available
      @exam.available = 0
      available = "false"
    else
      @exam.available = 1
      available = "true"
    end
    if @exam.save
      flash[:notice] = "Exam " + @exam.title + " Availability is now set to: " + available
      redirect_to :back
    end
  end
  def show_results 
    @exam = Exam.find(params[:id])
    if @exam.show_results
      @exam.show_results = 0
      results = "false"
    else
      @exam.show_results = 1
      results = "true"
    end
    if @exam.save
      flash[:notice] = "Exam " + @exam.title + " Show Results is now set to: " + results
      redirect_to :back
    end
  end
  def already_taken
    @exam = Exam.find(params[:id])
    if @user_submit = UserSubmit.includes(:user_answers).find(:first, :conditions =>{:user_id => current_user.id, :exam_id => @exam.id})
      unless @exam.retake
      flash[:notice] = "You have already taken this exam.  See instructor to enable it to be reopened." 
      redirect_to :back
      end
    end
  end
end
