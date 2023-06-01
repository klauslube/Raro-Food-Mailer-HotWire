# Raro Food - Parte 4

Projeto prático para aulas de Mailer, Jobs, Hotwire.

O projeto tem como o objetivo continuar o projeto raro-food, com o objetivo de : 

  - Criar o mailer para um chef ao um pedido ser feito
  - Jobs para atualizar preços unitários dos pedidos
  - Adicionar um botão 'Novo item do pedido' de forma dinamica com uso de Hotwire e TurboStream. 
  - Implementar o ActionText e ActionStorage para o cadastro de pratos. 


## Setup Inicial

Antes de iniciar a aplicação, recomenda-se a execução da seguinte sequência de comandos:

```
rvm use 3.1.2
cd exercicio-semana-12
bundle install
yarn: install
rails db:create
rails db:migrate
rails db:seed
```
Iniciar Servidor com:
```
./bin/dev
```
Iniciar Servidor sidekiq com:
```
redis-server & bundle exec sidekiq -C config/sidekiq.yml
```

## Login
Dados de acesso : 

email: klaus@gmail.com

password: 123456

## Tecnologias Utilizadas

- Rails
- Dbeaver
- Mysql
- Rubocop
- ActionText
- ActionStorage
- EmailCatcher
- Sidekiq
<br>

## Implementações

Na aplicação, as rotas e controllers para cada entidade foram criadas na semana 10 e algumas alteradas para essa parte da atividade. As views foram criadas na atividade da semana 11.

- Inicialmente foi criado o mailer para os chefs receberem um email a cada pedido em que os pratos deles fossem adicionados. Foi usado o mailcatcher para o recebimento de emails. O email possui um template estilizado o qual informa vários atributos do cliente, pedido, prato e links para o pedido/prato(necessário autenticar para ver).

- Foi implementado um job para quando ao atualizar o preço unitário de um prato, o preço total dos pedidos em que há esse prato e que esteja com status'started', também ser atualizado.

- Criado o botao de adicionar um prato ao pedido de forma dinamica com uso de TurboStream do Hotwire. 

- Adicionado Action Rich Text para a descrição de um prato, para isso foi refatorado o codigo, criando uma migration para mudar o nome de description para content. Também adicionado ActiveStorage para a poder adicionar fotos aos pratos criados.

## Desafios

 - Como maior desafio, foi fazer criar o job para atualizar os pedidos, é simples de se fazer mas foi preciso refatorar algumas vezes para ele ser feito de forma correta.

## Autor

Este projeto foi desenvolvido por Klaus Lube, como parte do exercício semanal da Raro Academy(Professor William Franklin de Souza e Guilherme Andrade) para aprimorar as habilidades em mailer, jobs, ActiveStorage.