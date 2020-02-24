require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? # 本番環境:AWS使用
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',     #AWSのアクセスキーとシークレットキーを環境変数で定義する
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id], #credentails.ymlに鍵の本体があります
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],  #credentails.ymlに鍵の本体があります
      region:'ap-northeast-1' #'AWSで設定した地域（おそらく'ap-northeast-1') '
      }
    config.fog_directory  = 'mercary5teamn'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercary5teamn'
  else
    config.storage :file # 開発環境:public/uploades下に保存
    config.enable_processing = false if Rails.env.test? 
  end
end