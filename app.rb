require "sinatra"
require_relative "isbn_method.rb"
require "csv"
require 'rubygems'
require 'aws/s3'
load "./local_env.rb"
def send_data_to_s3_bucket
    AWS::S3::Base.establish_connection!(
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET']  
    )
    file = "isbnres.csv" 
    bucket = 'lukesbuckeet'
    csv = AWS::S3::S3Object.value(file, bucket)
    csv << "some code here to show something being added to the bucket."+ "\n"
    AWS::S3::S3Object.store(File.basename(file), 
        csv, 
        bucket, 
        :access => :public_read)
end 
enable :sessions


get "/" do
	
	erb :number
end

post '/number' do
	session[:number] = params[:isbn]
	redirect "/results"
end

get '/results' do

	result = isbn_size_check(session[:number])
	erb :results, locals:{number:session[:number], result:result}
end	

post '/csv' do
	redirect '/cvs'
end	

get '/cvs' do
	thecsv = CSV.read("input_isbn_file.csv")
	erb :cvs, locals:{thecsv:thecsv}
end

post '/meth' do
  redirect '/magic'
end

get '/magic' do
	send_data_to_s3_bucket
	arr = []
	magiclist = CSV.read("input_isbn_file.csv")
	magiclist.each do |x|
		a = isbn_size_check(x[1])
		arr << a
	end 
	erb :magic, locals:{arr:arr, magiclist:magiclist}	
end	