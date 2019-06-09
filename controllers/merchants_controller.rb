require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/merchant.rb' )
also_reload( '../models/*' )

get '/manage/merchants' do # index
  @title = "GoGo Banking - Manage - Merchants"
  @merchants = Merchant.all()
  erb( :"merchants/index" )
end

get '/manage/merchants/new' do # new - new rec part1
  erb( :"merchants/new" )
end

post '/manage/merchants' do # create - new rec part2
  @merchant = Merchant.new( params )
  @merchant.save()
  redirect to '/manage/merchants'
end

post '/manage/merchants/:id/delete' do # delete / destroy
  merchant = Merchant.find( params[:id] )
  merchant.delete()
  redirect to '/manage/merchants'
end

get '/manage/merchants/:id/edit' do # edit - update part1
  @merchant = Merchant.find( params[:id] )
  erb( :"merchants/edit" )
end

post '/manage/merchants/:id' do # update - update part2
  @merchant = Merchant.new( params )
  @merchant.update
  redirect to '/manage/merchants'
end
