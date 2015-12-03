class ArticlePresenter < BasePresenter
  presents :article
  delegate :title, to: :article

  def linked_index_image(image_options = {}, link_options = {})
    if index_image.present?
      h.link_to index_image(image_options), article, link_options
    else
      h.link_to (h.image_tag 'placeholders/article-image.jpg', image_options), article, link_options
    end
  end

  def linked_title(options = {})
    h.link_to title, article, options
  end

  def linked_read_more(options = {})
    h.link_to 'Read more', article, options
  end

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
