require 'aws-sdk-s3'
require 'securerandom'

module S3able
  private

  def open_connection
    credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    Aws::S3::Client.new(region: 'us-east-1', credentials: credentials)
  end

  def upload_image
    connection = open_connection
    key = generate_key
    File.open(ENV['PICTURE_PATH'], 'rb') do |file|
      connection.put_object(bucket: ENV['AWS_BUCKET'], key: key, body: file)
    end
    key
  end

  def generate_key
    SecureRandom.uuid
  end
end
