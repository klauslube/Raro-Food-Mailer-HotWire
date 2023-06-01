filepath = ENV.fetch('FILEPATH', Rails.root.join('db/states_cities.json').to_s)
states = JSON.parse(File.read(filepath))

State.transaction do
  states.each do |state|
    state_obj = State.find_or_create_by!(acronym: state['acronym'], name: state['name'])

    cities_to_create = state['cities'].map { |city| { name: city['name'], state: state_obj } }
    City.create!(cities_to_create)

    Rails.logger.debug { "Adicionando as cidades #{cities_to_create.pluck(:name)} ao estado #{state_obj.name}" }
  end
end


# State.create(name: 'São Paulo', acronym: 'SP')
# State.create(name: 'Rio de Janeiro', acronym: 'RJ')

# City.create(name: 'São Paulo', state_id: 1)
# City.create(name: 'Rio de Janeiro', state_id: 2)

Address.create(name: 'Casa', public_place: 'Rua Principal', zip_code: '12345678', reference: 'Próximo ao mercado',
               complement: 'Casa 1', number: '123', neighborhood: 'Centro', city_id: 1, addressable_type: 'Customer', addressable_id: 1)

Address.create(name: 'Trabalho', public_place: 'Avenida Comercial', zip_code: '87654321',
               reference: 'Próximo ao escritório', complement: 'Sala 2', number: '456', neighborhood: 'Bairro Industrial', city_id: 2, addressable_type: 'Chef', addressable_id: 1)

User.create(name: 'Klaus', cpf: '12378945611', email: 'klaus@gmail.com', password: '123456')
User.create(name: 'Daniel', cpf: '12345678901', email: 'daniel@gmail.com', password: '123456')
User.create(name: 'Rita', cpf: '12378945612', email: 'rita@gmail.com', password: '123456')
User.create(name: 'Joao', cpf: '12378945644', email: 'joao@gmail.com', password: '123456')

Administrator.create(user_id: 1)

Chef.create(user_id: 2, address_id: 2, approver_id: 1)
Chef.create(user_id: 3, address_id: 2, approver_id: 1)

# Telephone.create(number: '123456789', contactable_type: 'Chef', contactable_id: 1)
# Telephone.create(number: '112233445', contactable_type: 'Customer', contactable_id: 2)

# Coupon.create(code: '1234', name: 'RARO10', content: 'RARO', start_date: '2023-04-09', end_date: '2023-04-15',
#               total_discount: 10.00, creator_id: 1)
# Coupon.create(code: '1231', name: 'RARO20', content: 'RARO', start_date: '2023-04-09', end_date: '2023-04-15',
#               total_discount: 20.00, creator_id: 1)

Dish.create(chef_id: 1, name: 'Lasanha', content: 'Lasanha com Molho Vermelho', available: true, active: true,
            unit_price: 100.00)
Dish.create(chef_id: 2, name: 'Strogonoff', content: 'Strogonoff de frango', available: true, active: true,
            unit_price: 50.00)

Dish.create(chef_id: 2, name: 'Lasanha', content: 'Lasanha à bolonhesa', available: true, active: true, unit_price: 45.00)
Dish.create(chef_id: 1, name: 'Salmão Grelhado', content: 'Salmão grelhado com legumes', available: true, active: true, unit_price: 60.00)

Category.create(name: 'Massa')
Category.create(name: 'Carne')

Customer.create(user_id: 4, birthday: '2000-09-10')

# Order.create(customer_id: 1, delivery_address_id: 1, total_price: 100.00, freight_price: 10.00, status: 1, coupon_id: 1)
# OrderItem.create(order_id: 1, dish_id: 1, amount: 1, unit_price: 100.00)

# Card.create(number: 123_456, name: 'Joao', security_code: 199, card_type: 'credit', expiration_date: '2023-04-16',
#             customer_id: 1)
# Payment.create(payment_type: 'credit_card', state: 'paid', order_id: 1, card_id: 1)
