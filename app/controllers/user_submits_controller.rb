class UserSubmitsController < ApplicationController
  # GET /user_submits
  # GET /user_submits.json
  def index
    @user_submits = UserSubmit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_submits }
    end
  end

  # GET /user_submits/1
  # GET /user_submits/1.json
  def show
    @user_submit = UserSubmit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_submit }
    end
  end

  # GET /user_submits/new
  # GET /user_submits/new.json
  def new
    @user_submit = UserSubmit.new
    @user_submit.user_id = current_user
    @user_submit.user_answers.build 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_submit }
    end
  end

  # GET /user_submits/1/edit
  def edit
    @user_submit = UserSubmit.find(params[:id])
  end

  # POST /user_submits
  # POST /user_submits.json
  def update
    params[:user_submit][:user_answers_attributes].each do |key,value|
      params[:user_submit][:user_answers_attributes][key] = params[:user_submit][:user_answers_attributes][key].merge(:user_id => current_user.id)
    end
    @user_submit = UserSubmit.find(params[:id])
    @user_submit.update_attributes(params[:user_submit])
    @user_submit.user = current_user
    #@user_submit.exam_id = @examid
    respond_to do |format|
      @user_submit.locked = 1
      if @user_submit.save
        @user_submit.exam.locked = 1
        @user_submit.exam.save
        @user_submit.exam.questions.each do |useq|
          useq.locked = 1
          useq.answers.each do |uqa|
            uqa.locked = 1
            uqa.save
          end
        end
        
        format.html { redirect_to exams_url, notice: 'User submit was successfully created.' }
        format.json { render json: @user_submit, status: :created, location: @user_submit }
      else
        #format.html { render action: "new" }
        format.json { render json: @user_submit.errors, status: :unprocessable_entity }
        format.html { redirect_to exams_url, notice: 'NOTICE! You may only submit answers for this exam once.  See your instructor for permission to re-take the exam.' }
      end
    end
  end

  # PUT /user_submits/1
  # PUT /user_submits/1.json
#  def update
#    params[:user_submit][:user_answers_attributes].each do |key,value|
#      params[:user_submit][:user_answers_attributes][key] = params[:user_submit][:user_answers_attributes][key].merge(:user_id => current_user.id)
#    end
#    @user_submit = UserSubmit.find(params[:id])
#
#    respond_to do |format|
#      if @user_submit.update_attributes(params[:user_submit])
#        format.html { redirect_to @user_submit, notice: 'User submit was successfully updated.' }
#        format.json { head :no_content }
#      else
#        format.html { render action: "edit" }
#        format.json { render json: @user_submit.errors, status: :unprocessable_entity }
#      end
#    end
#  end

 def display
    @user_submit = UserSubmit.find(params[:id])
    @exam = @user_submit.exam
    submit = @user_submit
    @grade = @exam.calc_grade(submit)
    respond_to do |format|
      format.html # display.html.erb
      format.json { render json: @exam }
    end
 end

  # DELETE /user_submits/1
  # DELETE /user_submits/1.json
  def destroy
    @user_submit = UserSubmit.find(params[:id])
    @user_submit.destroy

    respond_to do |format|
      format.html { redirect_to user_submits_url }
      format.json { head :no_content }
    end
  end
end
