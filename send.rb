require 'rubygems'
require 'aws-sdk'
require 'csv'
  load "./local_env.rb" 
def connect_to_s3()
Aws::S3::Client.new(
    access_key_id: ENV['S3_KEY'],
    secret_access_key: ENV['S3_SECRET'],
    region: ENV['AWS_REGION'],
  
  )
  file = "isbnres.csv" 
  bucket = 'lukesathorbucket'
  s3 = Aws::S3::Resource.new(region: 'us-east-2')
  obj = s3.bucket(bucket).object(file)
# string data
obj.put(body: 'some code here to show something being added to the bucket')
# push entire file 
    File.open('myfile.csv', 'rb') do |file|
      obj.put(body: file)
    end
end
connect_to_s3()

# require 'rubygems'
# require 'aws-sdk'
# require 'csv'
#   load "./local_env.rb" 
# def connect_to_s3()
#  Aws::S3::Client.new(
#     access_key_id: ENV['S3_KEY'],
#     secret_access_key: ENV['S3_SECRET'],
#     region: ENV['AWS_REGION'],
   
#   )
#   file = "isbnres.csv" 
#   bucket = 'lukesathorbucket'
#   s3 = Aws::S3::Resource.new(region: 'us-east-2')
#   obj = s3.bucket(bucket).object(file)
# # string data
# obj.put(body: '"some code here to show something being added to the bucket."+ "\n"')
# # push entire file 
# File.open('isbn_output_test.csv', 'rb') do |file|
#   obj.put(body: file)
# end
# end
# connect_to_s3()















# require 'rubygems'
# require 'aws/s3'
# require 'csv'
# load "./local_env.rb" 


# def send_data_to_s3_bucket
#     AWS::S3::Base.establish_connection!(
#     :access_key_id => 'AKIAILNWCFWBFHOUHCZA',
#     :secret_access_key => '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',
    
#     )
#     file = "isbnres.csv" 
#     bucket = 'lukesathorbucket'
#     csv = AWS::S3::S3Object.value(file, bucket)
#     csv << "some code here to show something being added to the bucket."+ "\n"
#     AWS::S3::S3Object.store(File.basename(file), 
#         csv, 
#         bucket, 
#         :access => :public_read)
# end 
    
# send_data_to_s3_bucket