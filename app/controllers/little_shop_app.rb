require 'pry'

class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  patch '/merchants/:id' do
    merchant = Merchant.find(params[:id])
    merchant.update(params[:merchant])
    redirect "/merchants/#{merchant.id}"
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

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/edit"
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id.to_i)
    redirect '/merchants'
  end

  patch '/invoices/:id' do
    invoice = Invoice.find(params[:id])
    invoice.update(params[:invoice])
    redirect "/invoices/#{invoice.id}"
  end

  get '/invoices' do
    @invoices = Invoice.all
    erb :'invoices/index'
  end

  get '/invoices/:id' do
    @invoice = Invoice.find(params[:id])
    erb :"invoices/show"
  end

  delete '/invoices/:id' do |id|
    Invoice.destroy(id.to_i)
    redirect '/invoices'
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.find(params[:id])
    erb :"invoices/edit"
  end

  get '/items' do
    @items = Item.all
    erb :"items/index"
  end

  patch '/items/:id' do
    item = Item.find(params[:id])
    item.update(params[:item])
    redirect "/items/#{item.id}"
  end

  get '/items/new' do
    @merchants = Merchant.all
    @item = Item.all.order(name: :asc)
    erb :"items/new"
  end

  post '/items' do
    Item.create(params)
    redirect '/items'
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :'items/show'
  end

  get '/items/:id/edit' do
    @merchants = Merchant.all
    @item = Item.find(params[:id])
    @merchants = Merchant.all
    erb :"items/edit"
  end

  delete '/items/:id' do |id|
    Item.destroy(id.to_i)
    redirect '/items'
  end

  get '/items-dashboard' do
    @items = Item.all
    erb :"items/dashboard"
  end
end
