FactoryGirl.define do
  factory :article do
    title "MyString"
    summary "MyText"
    content "<p>MyText</p>"
    date Date.today
    display true

    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    factory :article_with_image, traits: [:with_image]
  end

end
