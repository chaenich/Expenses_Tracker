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

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run( sql )
  end

end
