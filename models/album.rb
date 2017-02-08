require_relative ('../db/SqlRunner')


class Album

attr_reader :id, :title, :artist_id, :quantity, :genre

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @artist_id = options['artist_id'].to_i
    @quantity = options['quantity'].to_i
    @genre = options['genre']
  end

  def save()
    sql = "INSERT 
      INTO albums (artist_id, title, quantity, genre)
      VALUES (#{@artist_id}, '#{@title}', #{@quantity}, '#{@genre}') RETURNING *;"
      
    @id = SqlRunner.run(sql).first["id"]
  end

  def self.all()
    sql = ("SELECT * 
      FROM albums;")
    SqlRunner.run(sql).map { |album| Album.new(album)  }
  end

  def update()
    sql = "update Album SET (name) = ('#{@name}')WHERE id =#{@id};"
    SqlRunner.run(sql)
  end 

  def delete()
    sql = "DELETE * FROM Album WHERE id= #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM Album;"
    SqlRunner.run(sql)
  end
  def artist()
    sql = "SELECT * FROM artists where id = #{@artist_id};"
  return Artist.new(SqlRunner.run(sql).first)
  end
  def genre()
    return @genre
  end
  def quantity()
    return @quantity
  end
end
