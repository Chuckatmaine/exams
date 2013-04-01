class QuestionsController < ApplicationController
  before_filter :require_unlocked, :only => [:edit, :destroy]
  before_filter :require_owner, :only => [:edit, :destroy]
  before_filter :require_faculty, :only => [:show, :index, :new]
  # GET /questions
  # GET /questions.json
  def index
    if current_user.admin || current_user.faculty #Temporary for testing - need to remove faculty from this 
      @questions = Question.includes(:question_content_areas, :question_answers, :question_courses).all
    else
      @questions = Question.includes(:question_content_areas, :question_answers).find_all_by_department_id(current_user.department.id)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new
    @question.creator = current_user
    @question.question_courses.build
    @question.question_levels.build
    @question.question_content_areas.build
    question_answer = @question.question_answers.build
    @answer = @question.answers.build
    @answer.department_id = current_user.department_id
    @answer.creator = current_user
    question_answer.answer = @answer
    if current_user.admin || current_user.faculty  #Temporary for testing - need to remove faculty from this
      @courses = Course.all
      @levels= Level.all
      @content_areas = ContentArea.all
    else
      @courses = Course.where :department_id => current_user.department_id
      @levels = Level.where :department_id => current_user.department_id
      @content_areas = ContentArea.where :department_id => current_user.department_id
    end
    if @courses.count < 1
       flash[:notice] = "You must create courses before creating questions."
       redirect_to :back
       return
    end
    if @content_areas.count < 1
       flash[:notice] = "You must create content areas before creating questions."
       redirect_to :back
       return
    end
    if @levels.count < 1
       flash[:notice] = "You must create learning levels before creating questions."
       redirect_to :back
       return
    end

    @answers = Answer.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    question_answer = @question.question_answers.build
    @answer = @question.answers.build
    @answer.department_id = current_user.department_id
    @answer.creator = current_user
    question_answer.answer = @answer
    @courses = Course.where :department_id => current_user.department_id
    @levels = Level.where :department_id => current_user.department_id
    @content_areas = ContentArea.where :department_id => current_user.department_id
    #logger.debug "\n*****\n\n#{@question.question_answers.inspect}\n\n*****\n"
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])
    @question.creator = current_user
    @question.department = current_user.department
    @courses = Course.where :department_id => current_user.department_id
    @levels = Level.where :department_id => current_user.department_id
    @content_areas = ContentArea.where :department_id => current_user.department_id
    @question.value = 1
     respond_to do |format|
      if @question.save
        @question.reload
        @question.answers.each do |a| 
          if a.creator == nil && a.department == nil
           a.creator = current_user
           a.department = current_user.department
           a.save
          end
        end
       format.html { redirect_to questions_url, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])
    @question.department = current_user.department
    respond_to do |format|
      if @question.update_attributes(params[:question])
        @question.reload
        @question.answers.each do |a| 
          if a.creator == nil && a.department == nil
           a.creator = current_user
           a.department = current_user.department
           a.save
          end
        end
        format.html { redirect_to :back, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end
 def require_faculty
     unless (current_user.faculty) || (current_user.admin)
     flash[:notice] = "You must be faculty to access the questions page. "
     redirect_to :back
     end
  end
  def require_owner
    @question = Question.find(params[:id])
     unless (current_user == @question.creator) || (current_user.admin)
     flas[:notice] = "You must be the owner to modify this question."
     redirect_to @question
     end
  end
  def require_unlocked
    @question = Question.find(params[:id])
    if @question.locked
      flash[:notice] = "This question has been administered and is therefore locked. It can no longer be edited or deleted."
      redirect_to @question
    end
  end
end
