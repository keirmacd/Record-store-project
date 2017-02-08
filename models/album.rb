require_relative ('../db/SqlRunner')


class Album

attr_reader :id, :title, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @artist_id = options['artist_id'].to_i

  end

  def save()
    sql = ("INSERT 
      INTO albums (artist_id, title)
      VALUES (#{@artist_id}, '#{@title}')
      returning *")
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
    sql = "DELETE * FROM Album WHERE id= #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM Artist;"
    SqlRunner.run(sql)
  end
  def artist()
sql = "SELECT * FROM artists where id = #{@artist_id}"
  return Artist.new(SqlRunner.run(sql).first)
  end
end
