class DocumentUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumb do
    process :resize_to_fit => [495, 350]
    process :convert => 'png'
  end
  # Remove everything else
end
