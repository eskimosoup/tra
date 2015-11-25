class PagePresenter < BasePresenter
  presents :page
  delegate :title, :sidebar, to: :page

  def content
    h.raw page.content
  end

  def banner_image(options = {})
    if page.image.show.present?
      show_image(options)
    else
      h.image_tag 'components/banner/small-placeholder.jpg', options
    end
  end
end
