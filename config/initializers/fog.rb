CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAIJIHA3ET6S6CSFXQ',       # required
    :aws_secret_access_key  => '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',       # required
    #:region                 => 'eu-west-2'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'SaultSportsMedicine'                     # required
  #config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
  config.fog_public     = true                                    # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end