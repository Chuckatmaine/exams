class TestContentAreasController < ApplicationController
  # GET /test_content_areas
  # GET /test_content_areas.json
  def index
    @test_content_areas = TestContentArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_content_areas }
    end
  end

  # GET /test_content_areas/1
  # GET /test_content_areas/1.json
  def show
    @test_content_area = TestContentArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_content_area }
    end
  end

  # GET /test_content_areas/new
  # GET /test_content_areas/new.json
  def new
    @test_content_area = TestContentArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_content_area }
    end
  end

  # GET /test_content_areas/1/edit
  def edit
    @test_content_area = TestContentArea.find(params[:id])
  end

  # POST /test_content_areas
  # POST /test_content_areas.json
  def create
    @test_content_area = TestContentArea.new(params[:test_content_area])

    respond_to do |format|
      if @test_content_area.save
        format.html { redirect_to @test_content_area, notice: 'Test content area was successfully created.' }
        format.json { render json: @test_content_area, status: :created, location: @test_content_area }
      else
        format.html { render action: "new" }
        format.json { render json: @test_content_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_content_areas/1
  # PUT /test_content_areas/1.json
  def update
    @test_content_area = TestContentArea.find(params[:id])

    respond_to do |format|
      if @test_content_area.update_attributes(params[:test_content_area])
        format.html { redirect_to @test_content_area, notice: 'Test content area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_content_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_content_areas/1
  # DELETE /test_content_areas/1.json
  def destroy
    @test_content_area = TestContentArea.find(params[:id])
    @test_content_area.destroy

    respond_to do |format|
      format.html { redirect_to test_content_areas_url }
      format.json { head :no_content }
    end
  end
end
