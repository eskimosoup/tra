module Optimadmin
  class InterestPresenter < Optimadmin::BasePresenter
    presents :interest
    delegate :id, to: :interest

    def title
      interest.title
    end

    def toggle_title
      #inline_detail_toggle_link(title)
      title
    end

    def optimadmin_summary
      #h.simple_format interest.summary
    end
  end
end
