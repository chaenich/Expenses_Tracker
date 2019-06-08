require_relative( '../db/sql_runner' )

class Merchant

  attr_reader( :merchant_name, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
  end

  def save()

    sql = "INSERT INTO merchants
    (
      merchant_name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@merchant_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "
    UPDATE merchants
      SET merchant_name = $1
      WHERE id = $2"
    values = [@merchant_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end


  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    result = SqlRunner.run( sql, values ).first
    return Merchant.new( result )
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    transactions = SqlRunner.run( sql )
    return Merchant.map_all( transactions )
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run( sql )
  end

  def self.map_all( merchants_data )
    merchants = merchants_data.map { |merchant| Merchant.new( merchant )}
    return merchants
  end

  def self.transactions_total(id)
    sql = "SELECT SUM(amount)
      FROM transactions
      WHERE merchant_id = $1"
    values =[id]
    result = SqlRunner.run( sql, values ).first
    return result["sum"].to_i
  end

  def self.transactions_detail(id)
    sql = "SELECT m.merchant_name, tr.amount, t.tag_name
      FROM merchants m, transactions tr, tags t
      WHERE m.id = tr.merchant_id AND
      tr.tag_id = t.id AND
      m.id = $1"
    values = [id]
    merch_transactions_data = SqlRunner.run( sql, values )
    merch_transactions = merch_transactions_data.map{ |merch_transaction|  merch_transaction }
    return merch_transactions
  end

end
