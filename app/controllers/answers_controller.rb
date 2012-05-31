class AnswersController < ApplicationController
  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.find_all_by_department_id(current_user.department.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/new
  # GET /answers/new.json
  def new
    @answer = Answer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
    require_unlocked
    require_owner
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(params[:answer])
    @answer.creator_id = current_user
    @answer.department_id = current_user.department_id
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    @answer = Answer.find(params[:id])
    @answer.creator_id = current_user
    @answer.department_id = current_user.department_id
 
    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer = Answer.find(params[:id])
    require_owner
    require_unlocked
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end
  def require_faculty
    @answer = Answer.find(params[:id])
     unless (current_user.faculty) || (current_user.admin)
     flash[:notice] = "You must be a faculty to create answers."
     redirect_to @answer
     end
  end
  def require_owner
    @answer = Answer.find(params[:id])
     unless (current_user == @answer.creator) || (current_user.admin)
     flash[:notice] = "You must be the owner to modify this answer."
     redirect_to @answer
     end
  end
  def require_unlocked
    @answer= Answer.find(params[:id])
    if @answer.locked
      flash[:notice] = "This answer has been administered and is therefore locked. It can no longer be edited or deleted."
      redirect_to @answer
    end
  end
end
