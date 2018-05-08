require 'pry'

class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  patch '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    @merchant.update(params[:merchant])
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

  get '/invoices/:id' do
    @invoice = Invoice.find(params[:id])
    erb :"invoices/show"
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id.to_i)
    redirect '/merchants'
  end

  delete '/invoices/:id' do |id|
    Invoice.destroy(id.to_i)
    redirect '/invoices'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/edit"
  end

  patch '/merchants/:id' do
    merchant = Merchant.find(params[:id])
    merchant.update([params.first].to_h)
    redirect "/merchants/#{merchant.id}"
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.find(params[:id])

    erb :"invoices/edit"
  end
end
