require_relative("../db/SqlRunner")
require_relative("film")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize( options )
    @id = options['id'].to_i()
    @name = options['name']
    @funds = options['funds'].to_i()
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
      VALUES ($1, $2)
      RETURNING id"
    values = [$1, $2]
    customer = SqlRunner.run(sql, values).first()
    @id = customer['id'].to_i()
  end

end
