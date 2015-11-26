class ArticleController < ApplicationController
  before_action :set_interests
  before_action :set_article, only: [:show]

  def index
  end

  def show
    return redirect_to @article, status: :moved_permanently if request.path != article_path(@article)
  end

  private

    def set_page
      @article = Article.displayed.find(params[:id])
      @presented_article = present(@article)
    end

    def set_interests
      @presented_interests = present_collection(Interest.displayed) if @page.sidebar == 'interests'
    end
end
