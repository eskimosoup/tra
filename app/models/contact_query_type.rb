class ContactQueryType < ActiveRecord::Base
  validates :query_type, presence: true, uniqueness: { case_sensitive: false }

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true).positioned }
end
