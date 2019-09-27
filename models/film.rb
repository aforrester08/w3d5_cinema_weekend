require_relative("..db/SqlRunner")
require_relative("customer")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize( options )
    @id = options['id'].to_i()
    @title = options['title']
    @price = options['price'].to_i()
  end

end