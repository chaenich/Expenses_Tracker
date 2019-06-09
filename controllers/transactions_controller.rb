require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

get '/explore/transactions' do
  @title = "GoGo Banking - Explore - Transactions"
  @transactions = Transaction.all_transactions_detail()
  @total_spent =  Transaction.all_transactions_total()
  erb( :"transactions/index" )
end
