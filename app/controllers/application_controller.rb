class ApplicationController < Sinatra::Base
set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    bakery = Bakery.all
    bakery.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find_by(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
  baked_goods = BakedGood.all.order(price: :desc)
  baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    BakedGood.all.order(:price).last.to_json
end
end
