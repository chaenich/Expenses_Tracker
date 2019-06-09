require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/manage/tags' do # index
  @title = "GoGo Banking - Manage - Tags"
  @tags = Tag.all()
  erb( :"tags/index" )
end

get '/manage/tags/new' do # new - new rec part1
  erb( :"tags/new" )
end

post '/manage/tags' do # create - new rec part2
  @tag = Tag.new( params )
  @tag.save()
  redirect to '/manage/tags'
end

post '/manage/tags/:id/delete' do # delete / destroy
  tag = Tag.find( params[:id] )
  tag.delete()
  redirect to '/manage/tags'
end
