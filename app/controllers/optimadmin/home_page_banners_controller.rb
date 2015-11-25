module Optimadmin
  class HomePageBannersController < Optimadmin::ApplicationController
    before_action :set_home_page_banner, only: [:show, :edit, :update, :destroy]

    edit_images_for HomePageBanner, [[:image, { show: ['fill', 545, 258] }]]

    def index
      @home_page_banners = Optimadmin::BaseCollectionPresenter.new(collection: HomePageBanner.positioned.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::HomePageBannerPresenter)
    end

    def show
    end

    def new
      @home_page_banner = HomePageBanner.new
    end

    def edit
    end

    def create
      @home_page_banner = HomePageBanner.new(home_page_banner_params)
      if @home_page_banner.save
        redirect_to home_page_banners_url, notice: 'Home page banner was successfully created.'
      else
        render :new
      end
    end

    def update
      if @home_page_banner.update(home_page_banner_params)
        redirect_to home_page_banners_url, notice: 'Home page banner was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @home_page_banner.destroy
      redirect_to home_page_banners_url, notice: 'Home page banner was successfully destroyed.'
    end

  private


    def set_home_page_banner
      @home_page_banner = HomePageBanner.find(params[:id])
    end

    def home_page_banner_params
      params.require(:home_page_banner).permit(:position, :title, :image, :remove_image, :image_cache, :remote_image_url, :content, :display)
    end
  end
end
