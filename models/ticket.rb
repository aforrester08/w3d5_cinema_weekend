require_relative("..db/SqlRunner")
require_relative("film")
require_relative("customer")

class Tickets

  attr_reader :idea
  attr_accessor :film_id, :customer_id

  def initialize( options )
    @id = options['id'].to_i() if option['id']
    @film_id = options['film_id'].to_i()
    @customer_id = options['customer_id'].to_i()
  end

end
