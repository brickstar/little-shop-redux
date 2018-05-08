require 'pry'

class LittleShopApp < Sinatra::Base
  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/new' do
    erb :"merchants/new"
  end

  post '/merchants' do
    Merchant.create(params)
    redirect '/merchants'
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id.to_i)
    redirect '/merchants'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/edit"
  end

  put '/merchants/:id' do
    merchant = Merchant.find(params[:id])
    merchant.update([params.first].to_h)
    redirect "/merchants/#{merchant.id}"
  end

  get '/items' do
    @items = Item.all
    erb :"items/index"
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :'items/show'
  end
end
