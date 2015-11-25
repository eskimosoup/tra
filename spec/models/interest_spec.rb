require 'rails_helper'
#  rspec --tag 'interest'
RSpec.describe Interest, type: :model, interest: true do
  describe 'validations', :validation do
    let(:interest) { build(:interest).save(validate: false) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:colour) }
    it { should validate_inclusion_of(:colour).in_array(Interest::COLOURS) }
    it { should validate_presence_of(:link).with_message("can't be blank, unless you have a file") }
    it { should validate_presence_of(:file).with_message("can't be blank, unless you have a link") }
  end

  describe 'unique validations', :validation do
    let(:interest) { build(:interest, :with_file, :with_link) }

    it 'validates only file or link present' do
      expect(interest).not_to be_valid
      expect(interest.errors[:base]).to include 'Please provide a link or file, not both'
    end
  end

  describe 'scopes', :scope do
    let(:interest) { create(:interest_with_file) }
    let(:hidden_interest) { create(:interest_with_file, display: false) }

    it 'only returns displayed' do
      expect(Interest.displayed).not_to include hidden_interest
    end
  end
end
