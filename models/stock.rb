require_relative('../db/sql_runner')

class Stock

  attr_reader :album_id, :stock_level, :id

  def initialize(options)
    @id = options ['id'].to_i
    @album_id = options['album_id'].to_i
    @stock_level = options['stock_level']
  end

  def stock_level_checker
    if @stock_level > 50
      return "high"
    elsif @stock_level > 22
      return "medium"
    else
      return "low"
  end
end

  def save()
    sql = "INSERT INTO stock
    (
      album_id,
      stock_level
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@album_id, @stock_level]
    stock_data = SqlRunner.run(sql, values)
    @id = stock_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE stock
    SET
    (
      album_id,
      stock_level
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@album_id, @stock_level]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM stock
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all
  sql = "DELETE FROM stock"
  values = []
  SqlRunner.run(sql, values)
end

  def self.all()
    sql = "SELECT * FROM stock"
    stock = SqlRunner.run( sql )
    result = stock.map { |stock| Stock.new( stock ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM stock
    WHERE id = $1"
    values = [id]
    stock = SqlRunner.run( sql, values )
    result = Stock.new( stock.first )
    return result
  end
end
