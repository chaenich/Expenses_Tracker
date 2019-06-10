require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/manage/tags' do # index - show all
  @title = "GoGo Banking - Manage - Tags"
  @item_count = Tag.count_all()
  @tags = Tag.all()
  erb( :"tags/index" )
end

get '/manage/tags/new' do # new - new rec part1
  @title = "GoGo Banking - New Tag"
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

get '/manage/tags/:id/edit' do # edit - update part1
  @title = "GoGo Banking - Edit Tag"
  @tag = Tag.find( params[:id] )
  erb( :"tags/edit" )
end

post '/manage/tags/:id' do # update - update part2
  @tag = Tag.new( params )
  @tag.update
  redirect to '/manage/tags'
end
