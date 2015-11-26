require 'rails_helper'
#  rspec --tag 'contact_query_type'
RSpec.describe ContactQueryType, type: :model, contact_query_type: true do
  describe 'validations', :validation do
    subject(:contact_query_type) { build(:contact_query_type) }
    it { should validate_presence_of(:query_type) }
    it { should validate_uniqueness_of(:query_type).case_insensitive }
  end

  describe 'scopes', :scope do
    let(:contact_query_type) { create(:contact_query_type) }
    let(:hidden_contact_query_type) { create(:contact_query_type, display: false) }

    it 'only returns displayed' do
      expect(ContactQueryType.displayed).not_to include hidden_contact_query_type
    end
  end
end
