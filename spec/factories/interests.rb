FactoryGirl.define do
  factory :interest do
    position 1
    title "MyString"
    image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    colour "blue"
    display true

    trait :with_file do
      file { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    end

    trait :with_link do
      link "http://www.google.com"
    end

    factory :interest_with_link, traits: [:with_link]
    factory :interest_with_file, traits: [:with_file]
  end
end
