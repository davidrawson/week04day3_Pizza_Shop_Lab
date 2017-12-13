require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')

# INDEX
get('/pizzas') do
  @pizzas = Pizza.all()
  erb(:index)   # RESTful conventional naming.
end

# NEW
get('/pizzas/new') do
  erb(:new)
end

#UPDATE
post('/pizzas/:id') do
  @pizza = Pizza.new(params)
  @pizza.update()
  redirect('/pizzas')
end

# DELETE
post('/pizzas/:id/delete') do
  Pizza.delete(params[:id])
  #erb(:destroy)
  redirect('/pizzas')
end

# SHOW
get('/pizzas/:id') do
  @pizza = Pizza.find( params[:id] )
  erb(:show)
end

# EDIT
get ('/pizzas/:id/edit') do
  @pizza =Pizza.find( params[:id])
  erb(:edit)
end


# CREATE
post('/pizzas') do
  @pizza = Pizza.new(params)
  @pizza.save()
  erb(:create)
end
