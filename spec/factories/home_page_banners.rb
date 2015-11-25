FactoryGirl.define do
  factory :home_page_banner do
    position 1
    content "MyText"
    display true

    trait :with_image do
      image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    end
    factory :home_page_banner_with_image, traits: [:with_image]
  end

end
