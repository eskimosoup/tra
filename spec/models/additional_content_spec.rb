require 'rails_helper'
#  rspec --tag 'additional_content'
RSpec.describe AdditionalContent, type: :model, additional_content: true do
  describe 'validations', :validation do
    subject(:additional_content) { build(:additional_content) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:area) }
    it { should validate_uniqueness_of(:area) }
    it { should validate_inclusion_of(:area).in_array(AdditionalContent::AREAS) }
  end

  describe 'scopes', :scope do
    let(:additional_content) { create(:additional_content) }
    let(:hidden_additional_content) { build(:additional_content, area: 'Invalid', display: false).save(validate: false) }

    it 'only returns displayed' do
      expect(AdditionalContent.displayed).not_to include hidden_additional_content
    end

    it 'only returns area' do
      expect(AdditionalContent.area('Home page')).not_to include hidden_additional_content
    end
  end
end
