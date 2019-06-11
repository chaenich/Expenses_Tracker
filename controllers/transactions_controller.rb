require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

get '/explore/transactions' do # index - show all - view only
  @title = "GoGo Banking - Explore - Transactions"
  @item_count = Transaction.count_all()
  @total_spent =  Transaction.all_transactions_total()
  @transactions = Transaction.all_transactions_detail()
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb( :"transactions/index" )
end

get '/explore/transactions/filter' do # index - filter - view only
  @title = "GoGo Banking - Explore - Transactions"
  if params['merchant_id']
    # @transactions = Transaction.find_by_merchant_id(merchant)
    # --> if time to refactor
    @item_count = Merchant.transactions_count(params['merchant_id'].to_i)
    @total_spent =  Merchant.transactions_total(params['merchant_id'].to_i)
    @transactions = Merchant.transactions_detail(params['merchant_id'].to_i)
  elsif params['tag_id']
    # @transactions = Transaction.all()
    # --> if time to refactor
    @item_count = Tag.transactions_count(params['tag_id'].to_i)
    @total_spent =  Tag.transactions_total(params['tag_id'].to_i)
    @transactions = Tag.transactions_detail(params['tag_id'].to_i)
  else
    @item_count = Transaction.count_all()
    @total_spent =  Transaction.all_transactions_total()
    @transactions = Transaction.all_transactions_detail()
  end
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb( :"transactions/index" )
end

get '/manage/transactions' do # index - show all - manage
  @title = "GoGo Banking - Manage - Transactions"
  @item_count = Transaction.count_all()
  @transactions = Transaction.all_transactions_detail()
  erb( :"transactions/manage" )
end

post '/manage/transactions/:id/delete' do # delete / destroy
  transaction = Transaction.find( params[:id] )
  transaction.delete()
  redirect to '/manage/transactions'
end

get '/manage/transactions/new' do # new - new rec part1
  @title = "GoGo Banking - New Transaction"
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb( :"transactions/new" )
end

post '/manage/transactions' do # create - new rec part2
  @transaction = Transaction.new( params )
  @transaction.save()
  redirect to '/manage/transactions'
end

get '/manage/transactions/:id/edit' do # edit - update part1
  @title = "GoGo Banking - Edit Transaction"
  @merchants = Merchant.all()
  @tags = Tag.all()
  @transaction = Transaction.find( params[:id] )
  erb( :"transactions/edit" )
end

post '/manage/transactions/:id' do # update - update part2
  @transaction = Transaction.new( params )
  @transaction.update
  redirect to '/manage/transactions'
end
