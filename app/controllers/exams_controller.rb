class ExamsController < ApplicationController
  # GET /exams
  # GET /exams.json
  skip_before_filter :require_user, :only => [:show]
  before_filter :require_owner, :only => [:edit, :destroy]
  before_filter :require_unlocked, :only => [:edit, :destroy]
  before_filter :require_available, :only => [:take]

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

  # GET /exams/1/edit
  def edit
    @exam = Exam.find(params[:id])
    @courses = Course.find_all_by_department_id(current_user.department.id)
    @content_areas = ContentArea.find_all_by_department_id(current_user.department.id)
  end

  # POST /exams
  # POST /exams.json
  def take
    @exam = Exam.find(params[:id])
  end
  def create
    @exam = Exam.new(params[:exam])
    @courses = Course.find_all_by_department_id(current_user.department.id)

    @content_areas = ContentArea.find_all_by_department_id(current_user.department.id)
    @exam.department_id = current_user.department_id
    @exam.creator_id = current_user
    generate
    respond_to do |format|
      if @exam.save
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
    cleanup(@exam)
    @exam.department_id = current_user.department_id
    respond_to do |format|
      if @exam.update_attributes(params[:exam])
        generate
        format.html { redirect_to @exam }
        format.json { head :no_content }
#      logger.debug "\n\n *** \n\n content after generate. \n\n" + flash.inspect + "\n\n ********* \n"
      else
        format.html { render action: "edit" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  def generate
    #@exam = Exam.find(params[:id])
    @qtmp = 0 # flag that content areas matched
    @qcount = 0 #questions selected for exam
    @questions = Question.where(:available && :department_id => @exam.department).order('rand()')
    @questions.each do |q|
      q.courses.each do |qc|
        if qc.id == @exam.course_id
          q.content_areas.each do |qca|
            @exam.content_areas.each do |tca|
             if qca == tca  
               @qtmp = 1 
               tca.locked = 1
               tca.save
             end
            end
          end
        end
      end
      if @qtmp == 1 && @qcount < @exam.question_count 
        @tq = @exam.exam_questions.build :question => q
        @tq.save
        @qcount = @qcount + 1 
      end
      @qtmp = 0
    end
    if @qcount < @exam.question_count
      flash[:notice] = "Not enough questions were available that fit the requested parameters (Max available: " + @qcount.to_s + " ).  Exam NOT created!"
      cleanup(@exam)
      @exam.question_count = 0 
    else
      @exam.locked = 1
      @exam.course.locked = 1
      flash[:notice] = "Exam was created successfully!"
    end
  end
  def cleanup(exam)
    #@exam = Exam.find(params[:id])
    exam.exam_questions.each do |tq|
#      logger.debug "\n\n *** \n\n Cleaning up. \n\n" + tq.id.to_s + "\n\n ********* \n"
      tq.delete
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
   def require_faculty(exam)
    #@exam = Exam.find(params[:id])
     unless (current_user.faculty) || (current_user.admin)
     flash[:notice] = "You must be a faculty to create exams."
     redirect_to exam
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
    if @exam.locked
      flash[:notice] = "This exam has been administered and is therefore locked. It can no longer be edited or deleted."
      redirect_to @exam 
      return(0)
    end
  end
  def require_available
    @exam = Exam.find(params[:id])
    if @exam.available == false
      flash[:notice] = "This exam is not available at this time."
      redirect_to @exam
    end
    now = DateTime.current
    if  now < @exam.start_date || now > @exam.end_date
      flash[:notice] = "Exam " + @exam.title + " is only available from: " + @exam.start_date.to_s + " to: " + @exam.end_date.to_s + " Now: " + now.to_s
    end
  end
end
