class ContactsController < ApplicationController

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

    def contact_params
      params.require(:contact).permit(:name, :company, :email_address, :query_type, :phone_number, :further_information)
    end
end
