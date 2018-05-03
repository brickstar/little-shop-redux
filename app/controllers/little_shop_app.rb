class LittleShopApp < Sinatra::Base
  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/single_merchant/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/single_merchant"
  end
end
