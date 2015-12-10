require 'rails_helper'
#  rspec --tag 'frequently_asked_question'
RSpec.describe FrequentlyAskedQuestionPresenter, type: :presenter, frequently_asked_question: true do
  let(:frequently_asked_question) { build(:frequently_asked_question) }
  subject(:frequently_asked_question_presenter) { FrequentlyAskedQuestionPresenter.new(object: frequently_asked_question, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:id).to(:frequently_asked_question) }
  end

  describe 'standard frequently_asked_question' do
    it 'returns the linked question' do
      expect(frequently_asked_question_presenter.question).to eq(link_to (simple_format frequently_asked_question.question), "##{frequently_asked_question.id}", class: 'toggle-class', data: { container: "##{frequently_asked_question.id}", class: 'hide', return: 'false' })
    end

    it 'returns the answer - html formatted' do
      expect(frequently_asked_question_presenter.answer).to eq(content_tag :div, (raw frequently_asked_question.answer), id: frequently_asked_question.id, class: 'answer hide')
    end
  end
end
