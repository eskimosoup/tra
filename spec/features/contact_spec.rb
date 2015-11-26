require 'rails_helper'

RSpec.feature 'Contact form', type: :feature, contact: true do
=begin
  let!(:contact) { build(:contact) }
  let!(:contact_query_type) { create(:contact_query_type) }

  describe 'valid submission' do
    it 'successfully fills in and submits the form' do
      visit new_contact_path
      fill_in 'contact_name', with: contact.name
      fill_in 'contact_company', with: contact.company
      fill_in 'contact_email_address', with: contact.email_address
      #select contact_query_type.query_type, from: 'contact_query_type'
      click_button 'Send'
      expect(current_path).to eq(new_contact_path)
      expect(page).to have_text('Thank you for contacting us')
    end
  end
=end
end
