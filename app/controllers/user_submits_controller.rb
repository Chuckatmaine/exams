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
  def create
    @user_submit = UserSubmit.new(params[:user_submit])

    respond_to do |format|
      if @user_submit.save
        format.html { redirect_to @user_submit, notice: 'User submit was successfully created.' }
        format.json { render json: @user_submit, status: :created, location: @user_submit }
      else
        format.html { render action: "new" }
        format.json { render json: @user_submit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_submits/1
  # PUT /user_submits/1.json
  def update
    @user_submit = UserSubmit.find(params[:id])

    respond_to do |format|
      if @user_submit.update_attributes(params[:user_submit])
        format.html { redirect_to @user_submit, notice: 'User submit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_submit.errors, status: :unprocessable_entity }
      end
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
