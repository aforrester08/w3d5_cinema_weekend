require_relative("../db/SqlRunner")
require_relative("film")
require_relative("customer")
require_relative("screening")


class Ticket

  attr_reader :id
  attr_accessor :film_id, :customer_id, :screening_id

  def initialize( options )
    @id = options['id'].to_i() if options['id']
    @film_id = options['film_id'].to_i()
    @customer_id = options['customer_id'].to_i()
    @screening_id = options['screening_id'].to_i()
  end

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id, screening_id)
      VALUES ($1, $2, $3)
      RETURNING id"
    values = [@film_id, @customer_id, @screening_id]
    ticket = SqlRunner.run(sql, values).first()
    @id = ticket['id'].to_i()
  end

  def update()
    sql = "UPDATE tickets SET (film_id, customer_id)
    = ($1, $2) WHERE id = $3"
    values = [@film_id, @customer_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return tickets.map { |ticket| Ticket.new(ticket) }
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
