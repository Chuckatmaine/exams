class ExamsController < ApplicationController
  # GET /exams
  # GET /exams.json
  skip_before_filter :require_user, :only => [:show]
  before_filter :require_faculty, :only => [:new, :edit, :show]
  before_filter :require_owner, :only => [:edit, :destroy]
  before_filter :require_unlocked, :only => [:edit, :destroy]
  before_filter :require_available, :only => [:take] # Locks the exam the first time someone begins taking it

  def index
    @exams = Exam.find_all_by_department_id(current_user.department.id)


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
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam }
    end
  end
  def grade
    @exam = Exam.find(params[:id])
    @grade = 0
    @user_submit = UserSubmit.includes(:user_answers, :question_answers).find(:first, :conditions =>{:user_id => current_user.id, :exam_id => @exam.id})
    if @user_submit.nil?
     flash[:notice] = "You have not yet taken this exam." 
     redirect_to :back
    else
    @exam.exam_questions.each do |tq|
    @uacount = @user_submit.question_answers.where(:question_id => tq.question).count # how many user_answers for this question
    @correct = 0
    @count = 0
    tq.question.question_answers.each do |qa|
      if qa.is_correct 
        @correct = @correct + 1 # number of correct answers for this question
        @ua = @user_submit.user_answers.where(:question_answer_id => qa).each do |m| # match user answers to correct answers
        @count = @count + 1 #correct answer matched count
      logger.debug "\n\n ***Answers counts " + @count.to_s + "  " + @correct.to_s + " ********* \n"
        end
      end
    end # end answers
    if @count == @correct && @count == @uacount # must have correct matching count and no extra answers
      @grade = @grade + 1
     logger.debug "\n\n *** Grade counts\n\n . \n\n" + @grade.to_s + "  " + @count.to_s + "  " + @correct.to_s + "\n\n ********* \n"
    end
    end #end questions
    @grade = ((@grade.to_f / @exam.question_count.to_f) * 100)  
    respond_to do |format|
      format.html # grade.html.erb
      format.json { render json: @exam }
    end
    end
  end
  # GET /exams/1/edit
  def edit
    @exam = Exam.find(params[:id])
    @courses = Course.find_all_by_department_id(current_user.department.id)
    @content_areas = ContentArea.find_all_by_department_id(current_user.department.id)
  end

  # POST /exams
  # POST /exams.json
  def take
    @exam = Exam.includes(:questions, :answers).find(params[:id])
    if @user_submit = UserSubmit.includes(:user_answers).find(:first, :conditions =>{:user_id => current_user.id, :exam_id => @exam.id})
      # @user_submit.user_answers = UserAnswer.where(:user_id => current_user, :question_answer_id => @exam.question_answer)
    else
      @user_submit = UserSubmit.new
      @user_submit.user_id = current_user    
      @user_submit.locked = 0
      #@user_submit.user_answers.build 
    end
    @uahash = Hash.new
    @user_submit.user_answers.each do |ua|
      @uahash[ua.question_answer_id] = ua.id
    end

    #@user_answers = UserAnswer.where(:user_id => current_user)
    #@questions = ExamQuestion.where(:exam_id => @exam.id)
    @questions = @exam.questions
     respond_to do |format|
      format.html # take.html.erb
      format.json { render json: @exam }
    end
  end
  def create
    @exam = Exam.new(params[:exam])
    @courses = Course.find_all_by_department_id(current_user.department.id)

    @content_areas = ContentArea.find_all_by_department_id(current_user.department.id)
    @exam.department_id = current_user.department_id
    @exam.creator_id = current_user
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
    if @exam.locked
      flash[:notice] = "This exam has been administered and is therefore locked. It can no longer be edited or deleted."
      redirect_to @exam 
      return(0)
    end
  end
  def require_available
    @exam = Exam.includes(:user_submits).find(params[:id])
   if @exam.available == false
      flash[:notice] = "This exam is not available at this time."
      redirect_to @exam
    end
    now = DateTime.current
    if  now < @exam.start_date || now > @exam.end_date
      flash[:notice] = "Exam " + @exam.title + " is only available from: " + @exam.start_date.to_s + " to: " + @exam.end_date.to_s + " Now: " + now.to_s
      redirect_to :back
    end
    @exam.locked = 1 # Lock the exam once someone begins taking the exam 
    @exam.save
  end
end
