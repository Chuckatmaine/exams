class UserCoursesController < ApplicationController
  # GET /user_courses
  # GET /user_courses.json
  def index
    @user_courses = UserCourse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_courses }
    end
  end

  # GET /user_courses/1
  # GET /user_courses/1.json
  def show
    @user_course = UserCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_course }
    end
  end

  # GET /user_courses/new
  # GET /user_courses/new.json
  def new
    @user_course = UserCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_course }
    end
  end

  # GET /user_courses/1/edit
  def edit
    @user_course = UserCourse.find(params[:id])
  end

  # POST /user_courses
  # POST /user_courses.json
  def create
    @user_course = UserCourse.new(params[:user_course])

    respond_to do |format|
      if @user_course.save
        format.html { redirect_to @user_course, notice: 'User course was successfully created.' }
        format.json { render json: @user_course, status: :created, location: @user_course }
      else
        format.html { render action: "new" }
        format.json { render json: @user_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_courses/1
  # PUT /user_courses/1.json
  def update
    @user_course = UserCourse.find(params[:id])

    respond_to do |format|
      if @user_course.update_attributes(params[:user_course])
        format.html { redirect_to @user_course, notice: 'User course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_courses/1
  # DELETE /user_courses/1.json
  def destroy
    @user_course = UserCourse.find(params[:id])
    @user_course.destroy

    respond_to do |format|
      format.html { redirect_to user_courses_url }
      format.json { head :no_content }
    end
  end
end
