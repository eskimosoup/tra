class HomePageBanner < ActiveRecord::Base
  mount_uploader :image, HomePageBannerUploader

  validates :content, presence: true

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true).positioned }
end
