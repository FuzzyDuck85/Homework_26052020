require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order.rb')
also_reload('./models/*')

get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

get '/pizza-orders/new' do
  erb(:new)
end

get '/pizza-orders/:id' do
  # id = params[:id]
  # @order = PizzaOrder.find(id)
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

get '/pizza-orders/:id/edit' do
  # id = params[:id]
  # @order = PizzaOrder.edit(id)
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza_orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update
redirect to '/pizza-orders'
end

post '/pizza-orders/:id/delete' do
  # id = params[:id]
  # @order = PizzaOrder.delete(id)
  order = PizzaOrder.find(params[:id])
  order.delete
  redirect to '/pizza-orders'
  # redirect('/')
end
