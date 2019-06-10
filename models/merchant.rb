require_relative( '../db/sql_runner' )

class Merchant

  attr_reader( :name, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()

    sql = "INSERT INTO merchants
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "
    UPDATE merchants
      SET name = $1
      WHERE id = $2"
    values = [@name, @id]
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

def self.count_all()
    sql = "SELECT count(*) FROM merchants"
    result = SqlRunner.run( sql ).first
    return result["count"].to_i
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
    sql = "SELECT m.name, tr.amount, t.name
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
