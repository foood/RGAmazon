class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def category_params
    params.require(:category).permit(:title)
  end

  def new
    @category = Category.new

    respond_to do |format|
      format.html
      format.json { render json: @category }
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html
      format.js
      format.json { render json: @category }
    end
  end

  def update
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroy.' }
      format.json { head :no_content }
    end
  end
end
