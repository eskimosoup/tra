class FrequentlyAskedQuestionsController < ApplicationController
  def index
    @presented_frequently_asked_questions = present_collection(FrequentlyAskedQuestion.displayed)
    @presented_additional_content = present(AdditionalContent.area('Home page'))
    @presented_interests = present_collection(Interest.displayed)
  end
end
