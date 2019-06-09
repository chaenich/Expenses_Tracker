require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/manage/tags' do
  @title = "GoGo Banking - Manage - Tags"
  @tags = Tag.all()
  erb( :"tags/index" )
end
