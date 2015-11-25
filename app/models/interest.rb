class Interest < ActiveRecord::Base
  mount_uploader :image, InterestUploader
  mount_uploader :file, Optimadmin::DocumentUploader

  COLOURS = %w(blue green)

  validates :title, :colour, :image, presence: true
  validates :colour, inclusion: COLOURS
  validates :link, presence: { message: "can't be blank, unless you have a file" }, unless: :file?
  validates :file, presence: { message: "can't be blank, unless you have a link" }, unless: :link?
  validate :file_or_link

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true).positioned }

  def file_or_link
    errors[:base] << 'Please provide a link or file, not both' if file.present? && link.present?
  end
end
