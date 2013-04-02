class QuestionLevelsController < ApplicationController
  # GET /question_levels
  # GET /question_levels.json
  def index
    @question_levels = QuestionLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @question_levels }
    end
  end

  # GET /question_levels/1
  # GET /question_levels/1.json
  def show
    @question_level = QuestionLevel.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question_level }
    end
  end

  # GET /question_levels/new
  # GET /question_levels/new.json
  def new
    @question_level = QuestionLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question_level }
    end
  end

  # GET /question_levels/1/edit
  def edit
    @question_level = QuestionLevel.find(params[:id])
  end

  # POST /question_levels
  # POST /question_levels.json
  def create
    @question_level = QuestionLevel.new(params[:question_level])

    respond_to do |format|
      if @question_level.save
        format.html { redirect_to @question_level, notice: 'Question level was successfully created.' }
        format.json { render json: @question_level, status: :created, location: @question_level }
      else
        format.html { render action: "new" }
        format.json { render json: @question_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /question_levels/1
  # PUT /question_levels/1.json
  def update
    @question_level = QuestionLevel.find(params[:id])

    respond_to do |format|
      if @question_level.update_attributes(params[:question_level])
        format.html { redirect_to @question_level, notice: 'Question level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_levels/1
  # DELETE /question_levels/1.json
  def destroy
    @question_level = QuestionLevel.find(params[:id])
    @question_level.destroy

    respond_to do |format|
      format.html { redirect_to question_levels_url }
      format.json { head :no_content }
    end
  end
end
