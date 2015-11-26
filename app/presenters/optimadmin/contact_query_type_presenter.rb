module Optimadmin
  class ContactQueryTypePresenter < Optimadmin::BasePresenter
    presents :contact_query_type
    delegate :id, :query_type, to: :contact_query_type
  end
end
