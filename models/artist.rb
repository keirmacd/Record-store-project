require_relative ('../db/SqlRunner')

class Artist

attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']

  end
  def save()
    sql = ("INSERT 
      INTO artists (name)
      VALUES ('#{@name}' ) 
      RETURNING *;")
    @id = SqlRunner.run(sql).first["id"]
  end

  def self.all()
    sql = ("SELECT * 
      FROM artists;")
    SqlRunner.run(sql).map { |artist| Artist.new(artist)  }
  end


  def update()
    sql = "update artists SET (name) = ('#{@name}')WHERE id =#{@id};"
    SqlRunner.run(sql)
  end 

  def delete()
    sql = "DELETE * FROM artists WHERE id= #{@id}"
    SqlRunner.run(sql)
  end
  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)

  end


  def id()
    return @id
  end
end
