module Optimadmin
  class HomePageBannerPresenter < Optimadmin::BasePresenter
    presents :home_page_banner
    delegate :id, to: :home_page_banner

    def title
      home_page_banner.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format home_page_banner.content
    end
  end
end
