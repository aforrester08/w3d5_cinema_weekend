require_relative("../db/SqlRunner")
require_relative("film")
require_relative("customer")

class Ticket

  attr_reader :idea
  attr_accessor :film_id, :customer_id

  def initialize( options )
    @id = options['id'].to_i() if options['id']
    @film_id = options['film_id'].to_i()
    @customer_id = options['customer_id'].to_i()
  end

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id)
      VALUES ($1, $2)
      RETURNING id"
    values = [@film_id, @customer_id]
    ticket = SqlRunner.run(sql, values).first()
    @id = ticket['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return tickets.map { |ticket| Ticket.new(ticket) }
  end

end
