require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

get '/explore/transactions' do
  @title = "GoGo Banking - Explore - Transactions"
  @transactions = Transaction.all_transactions_detail()
  @total_spent =  Transaction.all_transactions_total()
  erb( :"transactions/index_explore" )
end

get '/manage/transactions' do
  @title = "GoGo Banking - Manage - Transactions"
  @transactions = Transaction.all_transactions_detail()
  erb( :"transactions/index_manage" )
end

post '/manage/transactions/:id/delete' do # delete / destroy
  transaction = Transaction.find( params[:id] )
  transaction.delete()
  redirect to '/manage/transactions'
end
