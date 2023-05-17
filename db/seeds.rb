State.create(name: "São Paulo", acronym: "SP")
State.create(name: "Rio de Janeiro", acronym: "RJ")

City.create(name: "São Paulo",state_id: 1)
City.create(name: "Rio de Janeiro",state_id: 2)

Address.create(name: "Casa",public_place: "Rua Principal",zip_code: "12345678",reference: "Próximo ao mercado",complement: "Casa 1",number: "123",neighborhood: "Centro",city_id: 1,addressable_type: "Customer",addressable_id: 1)

Address.create(name: "Trabalho",public_place: "Avenida Comercial",zip_code: "87654321",reference: "Próximo ao escritório",complement: "Sala 2",number: "456",neighborhood: "Bairro Industrial",city_id: 2,addressable_type: "Chef",addressable_id: 1)

User.create(name: "Daniel", cpf: "12345678901", email: "daniel@gmail.com", password: "password123")
User.create(name: "Klaus", cpf: "12378945611", email: "klaus@gmail.com", password: "password123")
User.create(name: "Rita", cpf: "12378945612", email: "rita@gmail.com", password: "password123")

Administrator.create(user_id: 1)

Chef.create(user_id: 2,address_id: 2,approver_id: 1)
Chef.create(user_id: 3, address_id: 2, approver_id: 1)

Telephone.create(number: "123456789", contactable_type: "Chef", contactable_id: 1)
Telephone.create(number: "112233445", contactable_type: "Customer", contactable_id: 2)

Coupon.create(code: "1234", name: "RARO10", description: "RARO", start_date: "2023-04-09", end_date: "2023-04-15", total_discount: 10.00, creator_id: 1)
Coupon.create(code: "1231", name: "RARO20", description: "RARO", start_date: "2023-04-09", end_date: "2023-04-15", total_discount: 20.00, creator_id: 1)

Dish.create(chef_id: 1, name: 'Lasanha', description: "Lasanha com Molho Vermelho", available: true, active: true, unit_price: 100.00)
Dish.create(chef_id: 2, name: 'Strogonoff', description: "Strogonoff de frango", available: true, active: true, unit_price: 50.00)