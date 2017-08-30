require "sinatra"
require_relative "isbn_method.rb"
enable :sessions


get "/" do
	erb :number
end