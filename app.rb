require "sinatra"
require_relative "isbn_method.rb"
require_relative "send.rb"
require "csv"
require 'rubygems'
require 'aws/s3'
require 'aws-sdk'
load "./local_env.rb"
 
enable :sessions


get "/" do
	list = get_file()
	erb :number, locals:{list:list}
end

post '/number' do
	session[:number] = params[:isbn]
	redirect "/results"
end

get '/results' do
	
	ready = get_file()
	result = isbn_size_check(session[:number])
	erb :results, locals:{number:session[:number], result:result, ready:ready}
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
	arr = []
	magiclist = CSV.read("input_isbn_file.csv")
	magiclist.each do |x|
		a = isbn_size_check(x[1])
		arr << a
	end 
	erb :magic, locals:{arr:arr, magiclist:magiclist}	
end	