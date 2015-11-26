class ContactsController < ApplicationController

  before_action :load_content

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.new_contact(@contact).deliver_now
      redirect_to new_contact_path, notice: 'Thank you for contacting us'
    else
      render :new
    end
  end

  private

    def load_content
      @presented_additional_content = present(AdditionalContent.area('Contact page'))
      @presented_interests = present_collection(Interest.displayed)
    end

    def contact_params
      params.require(:contact).permit(:name, :company, :email_address, :query_type, :phone_number, :further_information)
    end
end
