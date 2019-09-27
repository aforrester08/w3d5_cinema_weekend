require_relative("models/ticket")
require_relative("models/film")
require_relative("models/customer")

require('pry')

film1 = Film.new({'title' => '2001: A Space Odyessy', 'price' => 5 })
film1.save()
film2 = Film.new({'title' => 'Inception', 'price' => 4 })
film2.save()

customer1 = Customer.new({'name' => 'Alex', 'funds' => 20 })
customer1.save()
customer2 = Customer.new({'name' => 'Darcey', 'funds' => 30 })
customer2.save()

ticket1 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id})
ticket1.save()
ticket2 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id})
ticket2.save()

binding.pry
nil
