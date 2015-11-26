require 'rails_helper'
#  rspec --tag 'contact'
RSpec.describe Contact, type: :model, contact: true do

  describe 'validations', :validation do
    let!(:contact_query_type) { create(:contact_query_type) }
    subject(:contact) { build(:contact) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:email_address) }
    #it { should validate_inclusion_of(:query_type).in_array(ContactQueryType.displayed.to_a.map(&:query_type)) }
    it { expect(contact).to_not allow_value('optimised.today').for(:email_address) }
    it { expect(contact).to allow_value("paul@optimised.today").for(:email_address) }    
  end

  describe 'fields', :fields do
    subject(:contact) { build(:contact) }
    it { should have_attr_accessor(:name) }
    it { should have_attr_accessor(:company) }
    it { should have_attr_accessor(:email_address) }
    it { should have_attr_accessor(:query_type) }
    it { should have_attr_accessor(:phone_number) }
    it { should have_attr_accessor(:further_information) }
  end
end
