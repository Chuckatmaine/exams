class TestCoursesController < ApplicationController
  # GET /test_courses
  # GET /test_courses.json
  def index
    @test_courses = TestCourse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_courses }
    end
  end

  # GET /test_courses/1
  # GET /test_courses/1.json
  def show
    @test_course = TestCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_course }
    end
  end

  # GET /test_courses/new
  # GET /test_courses/new.json
  def new
    @test_course = TestCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_course }
    end
  end

  # GET /test_courses/1/edit
  def edit
    @test_course = TestCourse.find(params[:id])
  end

  # POST /test_courses
  # POST /test_courses.json
  def create
    @test_course = TestCourse.new(params[:test_course])

    respond_to do |format|
      if @test_course.save
        format.html { redirect_to @test_course, notice: 'Test course was successfully created.' }
        format.json { render json: @test_course, status: :created, location: @test_course }
      else
        format.html { render action: "new" }
        format.json { render json: @test_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_courses/1
  # PUT /test_courses/1.json
  def update
    @test_course = TestCourse.find(params[:id])

    respond_to do |format|
      if @test_course.update_attributes(params[:test_course])
        format.html { redirect_to @test_course, notice: 'Test course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_courses/1
  # DELETE /test_courses/1.json
  def destroy
    @test_course = TestCourse.find(params[:id])
    @test_course.destroy

    respond_to do |format|
      format.html { redirect_to test_courses_url }
      format.json { head :no_content }
    end
  end
end
