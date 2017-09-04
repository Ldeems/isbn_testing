require "sinatra"
require_relative "isbn_method.rb"
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