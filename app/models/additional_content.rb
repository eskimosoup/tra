class AdditionalContent < ActiveRecord::Base
  validates :content, presence: true

  AREAS = ['Home page']

  validates :area, presence: true, uniqueness: true, inclusion: AREAS

  scope :displayed, -> { where(display: true) }
  scope :area, -> (area) { displayed.find_by(area: area) }
end
