class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true # Force version generation at upload time.

  process convert: 'jpg'

  version :play_index do
    resize_to_fit 250, 350
  end

  version :play_show do
    resize_to_fit 325, 475
  end
end
