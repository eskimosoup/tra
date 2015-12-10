class PageUploader < Optimadmin::ImageUploader

  version :show do
    process resize_to_fill: [420, 83]
  end

end
