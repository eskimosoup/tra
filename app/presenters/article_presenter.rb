class ArticlePresenter < BasePresenter
  presents :article
  delegate :title, to: :article

  def date(format = :long)
    h.l article.date, format: format
  end

  def summary
    h.simple_format article.summary
  end

  def content
    h.raw article.content
  end

  def banner_image(options = {})
    if article.image.show.present?
      show_image(options)
    else
      h.image_tag 'components/banner/small-placeholder.jpg', options
    end
  end
end
