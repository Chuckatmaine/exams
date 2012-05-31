class TestCategoriesController < ApplicationController
  # GET /test_categories
  # GET /test_categories.json
  def index
    @test_categories = TestCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_categories }
    end
  end

  # GET /test_categories/1
  # GET /test_categories/1.json
  def show
    @test_category = TestCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_category }
    end
  end

  # GET /test_categories/new
  # GET /test_categories/new.json
  def new
    @test_category = TestCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_category }
    end
  end

  # GET /test_categories/1/edit
  def edit
    @test_category = TestCategory.find(params[:id])
  end

  # POST /test_categories
  # POST /test_categories.json
  def create
    @test_category = TestCategory.new(params[:test_category])

    respond_to do |format|
      if @test_category.save
        format.html { redirect_to @test_category, notice: 'Test category was successfully created.' }
        format.json { render json: @test_category, status: :created, location: @test_category }
      else
        format.html { render action: "new" }
        format.json { render json: @test_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_categories/1
  # PUT /test_categories/1.json
  def update
    @test_category = TestCategory.find(params[:id])

    respond_to do |format|
      if @test_category.update_attributes(params[:test_category])
        format.html { redirect_to @test_category, notice: 'Test category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_categories/1
  # DELETE /test_categories/1.json
  def destroy
    @test_category = TestCategory.find(params[:id])
    @test_category.destroy

    respond_to do |format|
      format.html { redirect_to test_categories_url }
      format.json { head :no_content }
    end
  end
end
