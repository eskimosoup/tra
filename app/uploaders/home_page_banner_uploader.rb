class HomePageBannerUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [545, 258]
  end
end
