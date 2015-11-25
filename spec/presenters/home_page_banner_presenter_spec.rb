require 'rails_helper'
#  rspec --tag 'home_page_banner'
RSpec.describe HomePageBannerPresenter, type: :presenter, home_page_banner: true do
  let(:home_page_banner) { build(:home_page_banner) }
  subject(:home_page_banner_presenter) { HomePageBannerPresenter.new(object: home_page_banner, view_template: view) }

  describe 'standard home page banner' do
    it 'returns the content' do
      expect(home_page_banner_presenter.content).to eq(simple_format home_page_banner.content)
    end
  end

  describe 'images' do
    describe 'no image' do
      it 'show_image should return placeholder' do
        expect(home_page_banner_presenter.show_image(alt: '')).to eq(view.image_tag('components/banner/large-placeholder.jpg', alt: ''))
      end
    end

    describe 'has image' do
      let(:home_page_banner) { build(:home_page_banner_with_image) }
      subject(:home_page_banner_presenter) { HomePageBannerPresenter.new(object: home_page_banner, view_template: view) }

      it 'show_image should not return nil' do
        expect(home_page_banner_presenter.show_image(alt: '')).to eq(image_tag(home_page_banner.image.show, alt: ''))
      end
    end
  end
end
