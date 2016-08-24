CarrierWave.configure do |config|
  config.fog_credentials = {
  	provider: ENV['carrier_wave_provider'],
    aws_access_key_id: ENV['carrier_wave_aws_access_key_id'],
    aws_secret_access_key: ENV['carrier_wave_aws_secret_access_key'],
    region:  ENV['carrier_wave_region']   
  }
  config.fog_directory  = ENV['carrier_wave__BUCKET_NAME']                          # required
end