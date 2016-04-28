require 'aws-sdk-v1'

AWS.config(
  :access_key_id => ENV['aws_access_key'],
  :secret_access_key => ENV['aws_secret_key']
)
S3_BUCKET = AWS::S3.new.buckets[ENV['aws_bucket_name']]