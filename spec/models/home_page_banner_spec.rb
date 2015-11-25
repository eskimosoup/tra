require 'rails_helper'
#  rspec --tag 'home_page_banner'
RSpec.describe HomePageBanner, type: :model, home_page_banner: true do
  describe 'validations', :validation do
    subject(:home_page_banner) { build(:home_page_banner) }
    it { should validate_presence_of(:content) }
  end

  describe 'scopes', :scope do
    let(:home_page_banner) { create(:home_page_banner) }
    let(:hidden_home_page_banner) { create(:home_page_banner, display: false) }

    it 'only returns displayed' do
      expect(HomePageBanner.displayed).not_to include hidden_home_page_banner
    end
  end
end
