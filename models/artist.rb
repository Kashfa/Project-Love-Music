require_relative('../db/sql_runner')

class Artist

  attr_reader :name, :id

  def initialize(options)
    @id = options ['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@name]
    artist_data = SqlRunner.run(sql, values)
    @id = artist_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE artists
    SET
    (
      name
    ) =
    (
      $1
    )
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM artists
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all
  sql = "DELETE FROM artists"
  values = []
  SqlRunner.run(sql, values)
end

  def self.all()
    sql = "SELECT * FROM artist"
    artists = SqlRunner.run( sql )
    result = artists.map { |artist| Artist.new( artist ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    artist = SqlRunner.run( sql, values )
    result = Artist.new( artist.first )
    return result
  end
end
