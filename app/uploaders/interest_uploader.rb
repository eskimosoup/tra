class InterestUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [136, 121]
  end
end
