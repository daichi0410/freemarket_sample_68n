require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if  Rails.env.production?#開発とテストは今まで通りに
    # config.storage = :file #本番はS3に保存する
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',     #AWSのアクセスキーとシークレットキーを環境変数で定義する
      aws_access_key_id: Rails.application.credentials[:aws][:access_key_id], #credentails.ymlに鍵の本体があります
      aws_secret_access_key: Rails.application.credentials[:aws][:secret_access_key],  #credentails.ymlに鍵の本体があります
      region:'ap-northeast-1' #'AWSで設定した地域（おそらく'ap-northeast-1') '
      }
    config.fog_directory  = 'mercary5teamn'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercary5teamn'
    else
  config.storage :file
  config.enable_processing = false if Rails.env.test?
    end
end