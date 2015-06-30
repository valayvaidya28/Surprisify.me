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
    @excerpt = Excerpt.find(params[:id])
    logger.info("1111191919191919191919191919191919191919191")
    logger.info(params[:content])
    if @excerpt.content!=params[:content] or @excerpt.book_name!=params[:book_name] or @excerpt.author_name!=params[:author_name]
      @excerpt.content = params[:content]
      @excerpt.book_name = params[:book_name]
      @excerpt.author_name = params[:author_name]
      @excerpt.save!
      flash[:success] = "Excerpt has been edited."
      redirect_to '/users/dashboard'
    else
      flash[:error] = "Something went wrong. Try again."
      redirect_to :edit
    end
  end

  def edit
    @excerpt = Excerpt.find_by_id(params[:id])
    @categories = Category.all
  end

  def destroy
  end
end
