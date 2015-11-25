class HomePageBannerPresenter < BasePresenter
  presents :home_page_banner

  def content
    h.simple_format home_page_banner.content
  end

  def show_image(options = {})
    if home_page_banner.image.present?
      h.image_tag home_page_banner.image.show, options
    else
      h.image_tag 'components/banner/large-placeholder.jpg', options
    end
  end
end
