class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, ArticleUploader

  validates :title, :content, :date, presence: true
  validates :suggested_url, allow_blank: true,
            uniqueness: {
              case_sensitive: false,
              message: 'is already taken, leave blank to generate automatically'
            }

  scope :latest_first, -> { order(date: :desc) }
  scope :displayed, -> { where("display = ? AND date <= ?", true, Date.today).latest_first }

  def slug_candidates
    [
      :suggested_url,
      :title,
      [:suggested_url, :title]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || title_changed?
  end
end
