class QuestionCoursesController < ApplicationController
  # GET /question_courses
  # GET /question_courses.json
  def index
    @question_courses = QuestionCourse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @question_courses }
    end
  end

  # GET /question_courses/1
  # GET /question_courses/1.json
  def show
    @question_course = QuestionCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question_course }
    end
  end

  # GET /question_courses/new
  # GET /question_courses/new.json
  def new
    @question_course = QuestionCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question_course }
    end
  end

  # GET /question_courses/1/edit
  def edit
    @question_course = QuestionCourse.find(params[:id])
  end

  # POST /question_courses
  # POST /question_courses.json
  def create
    @question_course = QuestionCourse.new(params[:question_course])

    respond_to do |format|
      if @question_course.save
        format.html { redirect_to @question_course, notice: 'Question course was successfully created.' }
        format.json { render json: @question_course, status: :created, location: @question_course }
      else
        format.html { render action: "new" }
        format.json { render json: @question_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /question_courses/1
  # PUT /question_courses/1.json
  def update
    @question_course = QuestionCourse.find(params[:id])

    respond_to do |format|
      if @question_course.update_attributes(params[:question_course])
        format.html { redirect_to @question_course, notice: 'Question course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_courses/1
  # DELETE /question_courses/1.json
  def destroy
    @question_course = QuestionCourse.find(params[:id])
    @question_course.destroy

    respond_to do |format|
      format.html { redirect_to question_courses_url }
      format.json { head :no_content }
    end
  end
end
