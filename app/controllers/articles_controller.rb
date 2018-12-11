class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @user    = current_user
    @article = Article.new
  end
  
  def create
    @article = Article.new(params.require(:article).permit(:title, :text))
    @article.user = current_user
    
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
  
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
