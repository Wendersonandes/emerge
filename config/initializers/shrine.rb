require "shrine"
require "shrine/storage/s3"

s3_options = {
  access_key_id:     ENV["AWS_KEY_ID"],
  secret_access_key: ENV["AWS_SECRET_KEY_ID"],
  region:            ENV["AWS_REGION"],
  bucket:            ENV["AWS_BUCKET"],
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", **s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :logging, logger: Rails.logger
Shrine.plugin :backgrounding

Shrine::Attacher.promote { |data| UploadJob.perform_async(data) }
Shrine::Attacher.delete { |data| DeleteJob.perform_async(data) }