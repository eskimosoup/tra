module Optimadmin
  class ContactQueryTypesController < Optimadmin::ApplicationController
    before_action :set_contact_query_type, only: [:show, :edit, :update, :destroy]

    def index
      @contact_query_types = Optimadmin::BaseCollectionPresenter.new(collection: ContactQueryType.positioned.where('query_type ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::ContactQueryTypePresenter)
    end

    def show
    end

    def new
      @contact_query_type = ContactQueryType.new
    end

    def edit
    end

    def create
      @contact_query_type = ContactQueryType.new(contact_query_type_params)
      if @contact_query_type.save
        redirect_to contact_query_types_url, notice: 'Contact query type was successfully created.'
      else
        render :new
      end
    end

    def update
      if @contact_query_type.update(contact_query_type_params)
        redirect_to contact_query_types_url, notice: 'Contact query type was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @contact_query_type.destroy
      redirect_to contact_query_types_url, notice: 'Contact query type was successfully destroyed.'
    end

  private


    def set_contact_query_type
      @contact_query_type = ContactQueryType.find(params[:id])
    end

    def contact_query_type_params
      params.require(:contact_query_type).permit(:position, :query_type, :display)
    end
  end
end
