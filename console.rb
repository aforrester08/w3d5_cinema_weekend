require_relative("models/ticket")
require_relative("models/film")
require_relative("models/customer")
require_relative("models/screening")

require('pry')

film1 = Film.new({'title' => '2001: A Space Odyessy', 'price' => 5 })
film1.save()
film2 = Film.new({'title' => 'Inception', 'price' => 4 })
film2.save()

customer1 = Customer.new({'name' => 'Alex', 'funds' => 20 })
customer1.save()
customer2 = Customer.new({'name' => 'Darcey', 'funds' => 30 })
customer2.save()

# ticket1 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id})
# ticket1.save()
# ticket2 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id})
# ticket2.save()
screening1 = Screening.new({'film_title' => film1.title, 'time' => '18:00'})
screening1.save()
screening2 = Screening.new({'film_title' => film1.title, 'time' => '20:00'})
screening2.save()
screening3 = Screening.new({'film_title' => film2.title, 'time' => '18:00'})
screening3.save()
screening4 = Screening.new({'film_title' => film2.title, 'time' => '20:00'})
screening4.save()

def buy_ticket(input_customer, input_film,input_screening)
  ticket = Ticket.new({'film_id' => input_film.id, 'customer_id' => input_customer.id})
  ticket.save()
  input_customer.funds -= input_film.price
  Screening.new({'film_title' => input_film.title, 'time' => input_screening.time})
end

Ticket.delete_all()
buy_ticket(customer1, film1, screening1)
buy_ticket(customer1, film2, screening3)
buy_ticket(customer2, film1, screening1)


binding.pry
nil
