require 'rubygems'
require 'aws-sdk'
require 'csv'
 

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
    File.open(myfile.csv, 'rb') do |file|
      obj.put(body: file)
    end
end


def get_file()
   s3 = Aws::S3::Client.new
  resp = s3.get_object(bucket:'lukesathorbucket', key:'myfile.csv')
  isbn = resp.body.read
  
jim = isbn.split
      list = []
    jim.each do |item|
    item.gsub!(/"/, '')
    list << item
    end
    p "#{list}!!!!!!!!!!!!!!!!"
  list

 
  
end



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















