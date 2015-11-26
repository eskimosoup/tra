module Optimadmin
  class ArticlesController < Optimadmin::ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    edit_images_for Article, [[:image, { show: ['limit', 545, 258], index: ['limit', 239, 174] }]]

    def index
      @articles = Optimadmin::BaseCollectionPresenter.new(collection: Article.latest_first.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::ArticlePresenter)
    end

    def show
    end

    def new
      @article = Article.new
    end

    def edit
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to articles_url, notice: 'Article was successfully created.'
      else
        render :new
      end
    end

    def update
      if @article.update(article_params)
        redirect_to articles_url, notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

  private


    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :summary, :content, :image, :remove_image, :remote_image_url, :image_cache, :date, :display, :suggested_url)
    end
  end
end
