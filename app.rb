require "sinatra"
require_relative "isbn_method.rb"
require "csv"
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
	arr = []
	magiclist = CSV.read("input_isbn_file.csv")
	magiclist.each do |x|
		a = isbn_size_check(x[1])
		arr << a
	end 
	erb :magic, locals:{arr:arr, magiclist:magiclist}	
end	