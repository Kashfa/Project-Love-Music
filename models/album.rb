require_relative('../db/sql_runner')

class Album

  attr_reader :title, :genre, :quantity, :artist_id, :id

  def initialize(options)
    @id = options ['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @quantity = options['quantity'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def stock_level_checker
    if @quantity > 50
      return "high"
    elsif @quantity > 22
      return "medium"
    else
      return "low"
    end
  end


  def save()
    sql = "INSERT INTO albums
    (
      title,
      genre,
      quantity,
      artist_id
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@title, @genre, @quantity, @artist_id]
    album_data = SqlRunner.run(sql, values)
    @id = album_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE albums
    SET
    (
      title,
      genre,
      quantity,
      artist_id
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@title, @genre, @quantity, @artist_id, @id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM albums
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def self.delete_all
      sql = "DELETE FROM albums"
      values = []
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM albums"
      albums = SqlRunner.run( sql )
      result = albums.map { |album| Album.new( album ) }
      return result
    end

    def self.find( id )
      sql = "SELECT * FROM albums
      WHERE id = $1"
      values = [id]
      album = SqlRunner.run( sql, values )
      result = Album.new( album.first )
      return result
    end
  end
