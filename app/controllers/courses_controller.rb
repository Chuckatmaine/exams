class CoursesController < ApplicationController
  before_filter :require_faculty, :only => [:destroy, :edit, :new, :index, :show]
  before_filter :require_owner, :only => [:destroy, :edit]
  before_filter :require_unlocked, :only => [:destroy, :edit]
  # GET /courses
  # GET /courses.json
  def index
    if current_user.admin
      @courses = Course.all
    else
      @courses = Course.find_all_by_department_id(current_user.department.id)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])
    @course.department_id = current_user.department_id
    @course.creator = current_user
    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_url, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    @course.department_id = current_user.department_id

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
  def require_faculty
      unless (current_user.faculty) || (current_user.admin)
      flash[:notice] = "You must be a faculty member to access course data."
      redirect_to :back 
      end
  end
  def require_owner
    @course = Course.find(params[:id])
     unless (current_user == @course.creator) || (current_user.admin)
     flash[:notice] = "You must be the owner to modify this course."
     redirect_to @course 
     end
  end
  def require_unlocked
    @course = Course.find(params[:id])
    if @course.locked
      flash[:notice] = "This course has been administered and is therefore locked. it can no longer be edited or deleted."
      redirect_to @course 
      return(0)
    end
  end
 
end
