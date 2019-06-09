require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/merchant.rb' )
also_reload( '../models/*' )

get '/manage/merchants' do
  @title = "GoGo Banking - Manage - Merchants"
  @merchants = Merchant.all()
  erb( :"merchants/index" )
end

post '/manage/merchants/:id/delete' do
  merchant = Merchant.find( params[:id] )
  merchant.delete()
  redirect to '/manage/merchants'
end
