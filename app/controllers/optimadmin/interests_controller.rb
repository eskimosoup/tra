module Optimadmin
  class InterestsController < Optimadmin::ApplicationController
    before_action :set_interest, only: [:show, :edit, :update, :destroy]

    edit_images_for Interest, [[:image, { show: ['fill', 136, 121] }]]

    def index
      @interests = Optimadmin::BaseCollectionPresenter.new(collection: Interest.positioned.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::InterestPresenter)
    end

    def show
    end

    def new
      @interest = Interest.new
    end

    def edit
    end

    def create
      @interest = Interest.new(interest_params)
      if @interest.save
        redirect_to interests_url, notice: 'Interest was successfully created.'
      else
        render :new
      end
    end

    def update
      if @interest.update(interest_params)
        redirect_to interests_url, notice: 'Interest was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @interest.destroy
      redirect_to interests_url, notice: 'Interest was successfully destroyed.'
    end

  private


    def set_interest
      @interest = Interest.find(params[:id])
    end

    def interest_params
      params.require(:interest).permit(:position, :title, :link, :file,
      :remove_file, :file_cache, :remote_file_url, :image, :remove_image,
      :remote_image_url, :image_cache, :colour, :display)
    end
  end
end
