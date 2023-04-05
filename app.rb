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
    @orders = params[:orders]
    s1 = @orders.split(',')

    @hh = {}
    s1.each do |el|
        s2 = el.split('=')
        s3 = s2[0].split('_')

        key = s3[1]
        value = s2[1]

        @hh[key] = value
    end

    erb :cart
end

get '/cart' do
    @orders = params[:orders]
    @orders = @orders.split(',')

    @hh = {}
    @orders.each do |str|
        @hh[str.slice(/product_\d/)] = 0
    end

    erb :cart
end