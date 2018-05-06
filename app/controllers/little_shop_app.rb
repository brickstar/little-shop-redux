class LittleShopApp < Sinatra::Base
  get '/merchants' do
    @merchants = Merchant.all
    erb:'merchants/index'
  end

  get '/merchants/:id/delete' do
    'hello world'
  end

  get '/merchants/single_merchant/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/single_merchant"
  end

  # delete '/merchants/:id' do |id|
  #   Merchant.destroy(id.to_i)
  # end
end
