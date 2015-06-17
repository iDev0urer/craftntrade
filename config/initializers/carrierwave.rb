CarrierWave.configure do |config|
  config.storage = :file
  config.asset_host = ENV['SITE_PATH']
end