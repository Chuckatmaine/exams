class ObjectivesController < ApplicationController
  before_filter :require_unlocked, :only => [:edit, :destroy]
  # GET /objectives
  # GET /objectives.json
  def index
    @objectives = Objective.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @objectives }
    end
  end

  # GET /objectives/1
  # GET /objectives/1.json
  def show
    @objective = Objective.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @objective }
    end
  end

  # GET /objectives/new
  # GET /objectives/new.json
  def new
    @objective = Objective.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @objective }
    end
  end

  # GET /objectives/1/edit
  def edit
    @objective = Objective.find(params[:id])
  end

  # POST /objectives
  # POST /objectives.json
  def create
    @objective = Objective.new(params[:objective])
    @objective.creator = current_user
    @objective.department = current_user.department
    respond_to do |format|
      if @objective.save
        format.html { redirect_to @objective, notice: 'Objective was successfully created.' }
        format.json { render json: @objective, status: :created, location: @objective }
      else
        format.html { render action: "new" }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /objectives/1
  # PUT /objectives/1.json
  def update
    @objective = Objective.find(params[:id])

    respond_to do |format|
      if @objective.update_attributes(params[:objective])
        format.html { redirect_to @objective, notice: 'Objective was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objectives/1
  # DELETE /objectives/1.json
  def destroy
    @objective = Objective.find(params[:id])
    @objective.destroy

    respond_to do |format|
      format.html { redirect_to objectives_url }
      format.json { head :no_content }
    end
  end
  def require_unlocked
    @objective = Objective.find(params[:id])
    if @objective.locked 
      flash[:notice] = "Objective " + @objective.name + " has been administered and is therefore locked. It can no longer be edited or deleted."
      redirect_to :back 
      return(0)
    end
  end
end
