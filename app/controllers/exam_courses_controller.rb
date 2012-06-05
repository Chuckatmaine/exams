class ExamCoursesController < ApplicationController
  # GET /exam_courses
  # GET /exam_courses.json
  def index
    @exam_courses = ExamCourse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exam_courses }
    end
  end

  # GET /exam_courses/1
  # GET /exam_courses/1.json
  def show
    @exam_course = ExamCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam_course }
    end
  end

  # GET /exam_courses/new
  # GET /exam_courses/new.json
  def new
    @exam_course = ExamCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam_course }
    end
  end

  # GET /exam_courses/1/edit
  def edit
    @exam_course = ExamCourse.find(params[:id])
  end

  # POST /exam_courses
  # POST /exam_courses.json
  def create
    @exam_course = ExamCourse.new(params[:exam_course])

    respond_to do |format|
      if @exam_course.save
        format.html { redirect_to @exam_course, notice: 'Exam course was successfully created.' }
        format.json { render json: @exam_course, status: :created, location: @exam_course }
      else
        format.html { render action: "new" }
        format.json { render json: @exam_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exam_courses/1
  # PUT /exam_courses/1.json
  def update
    @exam_course = ExamCourse.find(params[:id])

    respond_to do |format|
      if @exam_course.update_attributes(params[:exam_course])
        format.html { redirect_to @exam_course, notice: 'Exam course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_courses/1
  # DELETE /exam_courses/1.json
  def destroy
    @exam_course = ExamCourse.find(params[:id])
    @exam_course.destroy

    respond_to do |format|
      format.html { redirect_to exam_courses_url }
      format.json { head :no_content }
    end
  end
end
