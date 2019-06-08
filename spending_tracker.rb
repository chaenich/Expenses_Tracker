require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require_relative('./controllers/transactions_controller')
# require_relative('./controllers/merchants_controller')
# require_relative('./controllers/tags_controller')
also_reload( './models/*' )

get '/' do
  @title = "Go_Go Banking"
  erb( :index )
end

get '/about' do
  @title = "GoGo Banking - About"
  erb( :about )
end

get '/contact' do
  @title = "GoGo Banking - Contact"
  erb( :contact )
end
