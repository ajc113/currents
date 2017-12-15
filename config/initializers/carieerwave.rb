unless Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['S3_KEY'],
      aws_secret_access_key: ENV['S3_SECRET'],
      region:                ENV['S3_REGION'],
      host:                  's3.amazonaws.com',
    }
    config.fog_provider = 'fog'
    config.fog_directory  = ENV['S3_BUCKET']
    #config.asset_host = "https://s3-us-east-1.amazonaws.com"
    config.fog_use_ssl_for_aws = false
    config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" }
  end
end
