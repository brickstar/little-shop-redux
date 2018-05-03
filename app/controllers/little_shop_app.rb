class LittleShopApp < Sinatra::Base
  get '/merchants' do
require 'pry';binding.pry
    @merchants = Merchant.all
    erb :"merchants/index"
  end
end
