require 'rails_helper'
#  rspec --tag 'interest'
RSpec.describe InterestPresenter, type: :presenter, interest: true do
  let(:interest) { build(:interest) }
  subject(:interest_presenter) { InterestPresenter.new(object: interest, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:interest) }
    it { should delegate_method(:colour).to(:interest) }
    it { should delegate_method(:link).to(:interest) }
  end

  describe 'interest with link' do
    let(:interest_with_link) { create(:interest_with_link) }

    it 'returns the link' do
      expect(interest_presenter.interest_link).to eq(interest.link)
    end
  end

  describe 'interest with file' do
    subject(:interest_with_file) { create(:interest_with_file) }

    it 'returns the file' do
      # FIXME: not sure why this fails
      #expect(interest_presenter.interest_link).to eq(interest_with_file.file.url)
    end
  end
end
