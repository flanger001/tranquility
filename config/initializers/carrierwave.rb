CarrierWave.configure do |config|
  config.aws_credentials = {
    # Configuration for Amazon S3
    access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region: ENV["FOG_REGION"]
  }

  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.aws_bucket  = ENV["FOG_DIRECTORY"]
  config.aws_acl     = "bucket-owner-full-control"
  config.aws_attributes = {
    cache_control: "max-age=#{365.day.to_i}"
  }

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :aws
  end
end
