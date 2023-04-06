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
    orders_input = params[:orders]
    @orders = parse_orders_input(orders_input)

    product = Product.find(@orders[0][0])

    erb "Hello! #{product.title}"
end

get '/cart' do

    erb :cart
end

def parse_orders_input orders_input

    s1 = orders_input.split(',')

    arr = []
    s1.each do |el|
        s2 = el.split('=')
        s3 = s2[0].split('_')

        id  = s3[1]
        cnt = s2[1]

        arr2 = [id, cnt]

        arr.push arr2

    end

    return arr
end