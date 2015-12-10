class FrequentlyAskedQuestionPresenter < BasePresenter
  presents :frequently_asked_question

  delegate :id, to: :frequently_asked_question

  def question
    h.link_to "##{id}", class: 'toggle-class', data: { container: "##{id}", class: 'hide', return: 'false' } do
      h.simple_format frequently_asked_question.question
    end
  end

  def answer
    h.content_tag :div, id: id, class: 'answer hide' do
      h.raw frequently_asked_question.answer
    end
  end
end
