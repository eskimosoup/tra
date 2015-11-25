module Optimadmin
  class FrequentlyAskedQuestionPresenter < Optimadmin::BasePresenter
    presents :frequently_asked_question
    delegate :id, :question, :answer, to: :frequently_asked_question

    def title
      frequently_asked_question.question
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format answer
    end

    def view_link
      h.link_to eye, h.main_app.frequently_asked_questions_path(anchor: title.parameterize), target: '_blank', class: 'menu-item-control'
    end
  end
end
