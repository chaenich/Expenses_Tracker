require_relative( '../db/sql_runner' )
require('pry')

class Transaction

  attr_reader( :amount, :merchant_id, :tag_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions
    (
      amount,
      merchant_id,
      tag_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@amount, @merchant_id, @tag_id]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "
    UPDATE transactions
      SET ( amount, merchant_id, tag_id )
      =
      ( $1, $2, $3 )
      WHERE id = $4"
    values = [@amount, @merchant_id, @tag_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end


  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    result = SqlRunner.run( sql, values ).first
    return Transaction.new( result )
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.run( sql )
    return Transaction.map_all( transactions )
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run( sql )
  end

  def self.map_all( transactions_data )
    transactions = transactions_data.map { |transaction| Transaction.new( transaction )}
    return transactions
  end

  def self.all_transactions_total()
    sql = "SELECT SUM(amount)
      FROM transactions"
      result = SqlRunner.run( sql ).first
      return result["sum"].to_i
    end

  def self.all_transactions_detail()
    sql = "SELECT m.merchant_name, tr.amount, t.tag_name
      FROM transactions tr, merchants m, tags t
      WHERE m.id = tr.merchant_id AND
      tr.tag_id = t.id"
    transactions_data = SqlRunner.run( sql )
    transactions = transactions_data.map { |transaction| transaction }
    return transactions
  end
end
