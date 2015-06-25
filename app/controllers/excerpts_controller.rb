class ExcerptsController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @except = Excerpt.new
    @categories = Category.all
  end

  def create
    all_params = params
    @excerpt= Excerpt.new(:content => all_params[:content], :author_name=> all_params[:author_name], :book_name => all_params[:book_name])
    all_params.each do |key, value|
      if key.start_with?("category")
        category = Category.find_by_category_name(value)
        @excerpt.categories << category
        @excerpt.save!
      end
    end
    if @excerpt.save
      current_user.excerpts << @excerpt
      current_user.save!
      flash[:success] = "Exceprt has been successfully added to the database."
      redirect_to and return '/excerpts'
    else
      render 'new'
    end
  end

  def category_excerpt
    @category = Category.find_by_id(params[:id])
    @excerpts_with_categories = @category.excerpts
  end

  def select_excerpt
    offset = rand(Excerpt.count)
    @excerpt = Excerpt.offset(offset).first
    logger.info(@excerpt.id)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
