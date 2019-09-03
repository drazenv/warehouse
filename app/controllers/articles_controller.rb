class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if article_params[:stock].to_i >= 0 && !article_params[:stock].match(/[0-9]/).nil?
      Article.update(article_params)
      redirect_to articles_url
    else
       flash[:alert] = "update failed"
      redirect_to edit_article_url(@article)
    end
  end

  private

  def article_params
    params.require(:article).permit(:name, :stock)
  end
end
