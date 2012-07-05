class ExamUsersController < ApplicationController
  # GET /exam_users
  # GET /exam_users.json
  def index
    @exam_users = ExamUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exam_users }
    end
  end

  # GET /exam_users/1
  # GET /exam_users/1.json
  def show
    @exam_user = ExamUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam_user }
    end
  end

  # GET /exam_users/new
  # GET /exam_users/new.json
  def new
    @exam_user = ExamUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam_user }
    end
  end

  # GET /exam_users/1/edit
  def edit
    @exam_user = ExamUser.find(params[:id])
  end

  # POST /exam_users
  # POST /exam_users.json
  def create
    @exam_user = ExamUser.new(params[:exam_user])

    respond_to do |format|
      if @exam_user.save
        format.html { redirect_to @exam_user, notice: 'Exam user was successfully created.' }
        format.json { render json: @exam_user, status: :created, location: @exam_user }
      else
        format.html { render action: "new" }
        format.json { render json: @exam_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exam_users/1
  # PUT /exam_users/1.json
  def update
    @exam_user = ExamUser.find(params[:id])

    respond_to do |format|
      if @exam_user.update_attributes(params[:exam_user])
        format.html { redirect_to @exam_user, notice: 'Exam user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_users/1
  # DELETE /exam_users/1.json
  def destroy
    @exam_user = ExamUser.find(params[:id])
    @exam_user.destroy

    respond_to do |format|
      format.html { redirect_to exam_users_url }
      format.json { head :no_content }
    end
  end
end
