class TestsController < ApplicationController
  # GET /tests
  # GET /tests.json
  skip_before_filter :require_user, :only => [:show]
  def index
    @tests = Test.find_all_by_department_id(current_user.department.id)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tests }
    end
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    @test = Test.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test }
    end
  end

  # GET /tests/new
  # GET /tests/new.json
  def new
    @test = Test.new
    @courses = Course.find_all_by_department_id(current_user.department.id)
    @content_areas = ContentArea.find_all_by_department_id(current_user.department.id)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test }
    end
  end

  # GET /tests/1/edit
  def edit
    @courses = Course.find_all_by_department_id(current_user.department.id)

    @test = Test.find(params[:id])
    if require_owner(@test) &&  require_unlocked(@test)
    require_unlocked(@test)
    @content_areas = ContentArea.find_all_by_department_id(current_user.department.id)
    end
  end

  # POST /tests
  # POST /tests.json
  def take
    @test = Test.find(params[:id])
    require_unlocked(@test)
    require_available(@test)
  end
  def create
    @test = Test.new(params[:test])
    @courses = Course.find_all_by_department_id(current_user.department.id)

    @content_areas = ContentArea.find_all_by_department_id(current_user.department.id)
    @test.department_id = current_user.department_id
    @test.creator_id = current_user
    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
    generate
        format.json { render json: @test, status: :created, location: @test }
      else
        format.html { render action: "new" }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tests/1
  # PUT /tests/1.json
  def update
    @test = Test.find(params[:id])
    cleanup(@test)
    @test.department_id = current_user.department_id
    respond_to do |format|
      if @test.update_attributes(params[:test])
        generate
        format.html { redirect_to @test }
        format.json { head :no_content }
#      logger.debug "\n\n *** \n\n content after generate. \n\n" + flash.inspect + "\n\n ********* \n"
      else
        format.html { render action: "edit" }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def generate
    #@test = Test.find(params[:id])
    @qtmp = 0 # flag that content areas matched
    @qcount = 0 #questions selected for test
    @questions = Question.where(:available && :department_id => @test.department).order('rand()')
    @questions.each do |q|
      q.courses.each do |qc|
        if qc.id == @test.course_id
          q.content_areas.each do |qca|
            @test.content_areas.each do |tca|
             if qca == tca  
               @qtmp = 1 
               tca.locked = 1
               tca.save
             end
            end
          end
        end
      end
      if @qtmp == 1 && @qcount < @test.question_count 
        @tq = TestQuestion.new
        @tq.test_id = @test.id
        @tq.question_id = q.id
        @tq.save
        @qcount = @qcount + 1 
      end
      @qtmp = 0
    end
#    logger.debug "\n\n **** \n\n " + @qcount.to_s + "\n\n ***** \n" + "\n\n" + @test.question_count.to_s + "\n\n ***** \n"
    if @qcount < @test.question_count
      flash[:notice] = "Not enough questions were available for the number requested (Max: " + @qcount.to_s + " ).  Test NOT created!"
#      logger.debug "\n\n *** \n\n content before cleanup. \n\n" + flash.inspect + "\n\n ********* \n"
      cleanup(@test)
    else
      @test.locked = 1
      flash[:notice] = "Test was created successfully!"
    end
  end
  def cleanup(test)
    #@test = Test.find(params[:id])
    test.test_questions.each do |tq|
#      logger.debug "\n\n *** \n\n Cleaning up. \n\n" + tq.id.to_s + "\n\n ********* \n"
      tq.delete
    end
      test.save
  end
  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test = Test.find(params[:id])
    if require_unlocked(@test) && require_owner(@test)
    @test.delete
    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :no_content }
    end
    end
  end
   def require_faculty(test)
    #@test = Test.find(params[:id])
     unless (current_user.faculty) || (current_user.admin)
     flash[:notice] = "You must be a faculty to create tests."
     redirect_to test
     return(0)
     end
  end
  def require_owner(test)
     unless (current_user == test.creator) || (current_user.admin)
     flash[:notice] = "You must be the owner to modify this test."
     redirect_to test
     return(0)
     end
  end
  def require_unlocked(test)
    #@test = Test.find(params[:id])
    if @test.locked
      flash[:notice] = "This test has been administered and is therefore locked. It can no longer be edited or deleted."
      redirect_to test 
      return(0)
    end
  end
  def require_available(test)
    #@test = Test.find(params[:id])
    if @test.available == false
      flash[:notice] = "This test is not available at this time."
      redirect_to test
      return(0)
    end
    now = DateTime.current
    if  now < @test.start_date || now > @test.end_date
      flash[:notice] = "Test " + @test.title + " is only available from: " + @test.start_date.to_s + " to: " + @test.end_date.to_s + " Now: " + now.to_s
    end
  end
end
