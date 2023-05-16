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

