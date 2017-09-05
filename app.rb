require "sinatra"
require_relative "isbn_method.rb"
require "csv"
enable :sessions


get "/" do
	session[:list] = CSV.read("input_isbn_file.csv")
	erb :number, locals:{list:session[:list]}
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
	erb :cvs, locals:{list:session[:list]}
end

post '/meth' do
  redirect '/magic'
end

get '/magic' do
	arr = []
	magiclist = session[:list]
	magiclist.each do |x|
		a = isbn_size_check(x[1])
		arr << a
	end 
	erb :magic, locals:{arr:arr}	
end	