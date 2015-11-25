class InterestPresenter < BasePresenter
  presents :interest

  delegate :colour, :title, :link, to: :interest

  def interest_link
    if interest.file.present?
      interest.file.url
    else
      link
    end
  end
end
