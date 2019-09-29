require_relative("../db/SqlRunner")
require_relative("film")
require_relative("customer")
require_relative("ticket")

class Screening

  attr_reader :id
  attr_accessor :film_title, :film_id, :time

  def initialize( options )
    @id = options['id']
    @film_title = options['film_title']
    @time = options['time']
  end

  def save()
    sql = "INSERT INTO screenings (film_title, time)
      VALUES ($1, $2)
      RETURNING id"
    values = [@film_title, @time]
    screening = SqlRunner.run(sql, values).first()
    @id = screening['id'].to_i()
  end

  def update()
    sql = "UPDATE screenings SET (film_title, time)
    = ($1, $2) WHERE id = $3"
    values = [@film_title, @time, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    screenings = SqlRunner.run(sql)
    return screenings.map { |screening| Screening.new(screening) }
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

end
