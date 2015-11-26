class Contact
  include ActiveModel::Model
  attr_accessor :name, :company, :email_address, :phone_number, :query_type, :further_information
  validates :name, :company, :email_address, :query_type, presence: true
  validates :email_address, email: true
  validates :query_type, inclusion: { in: ContactQueryType.displayed.to_a.map(&:query_type) }
end
