#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "pizzashop.db"}

class Product < ActiveRecord::Base

end

get '/' do
    @products = Product.order('created_at DESC')
    erb :index 
end

get '/about' do
    erb :about
end

post '/cart' do
    redirect '/cart'
end

get '/cart' do

    erb :cart
end