class ArticlesController < ApplicationController
  before_action :set_interests
  before_action :set_article, only: [:show]

  def index
    @presented_articles = present_collection(Article.displayed)
  end

  def show
    return redirect_to @article, status: :moved_permanently if request.path != article_path(@article)
    @presented_articles = present_collection(Article.displayed.limit(3))
  end

  private

    def set_article
      @article = Article.displayed.find(params[:id])
      @presented_article = present(@article)
    end

    def set_interests
      @presented_interests = present_collection(Interest.displayed)
    end
end
