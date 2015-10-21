CarrierWave.configure do |config|
  config.storage = :aws
  config.aws_bucket  = 'nomster-jon'
  config.aws_acl = 'public-read'
  config.aws_credentials = {
      :access_key_id     => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET'],
      :region            => 'us-east-1'
  }
end
