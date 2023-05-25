# Raro Food - Parte 3

Projeto prático para aulas de Views, MVC.

O projeto tem como o objetivo continuar o projeto raro-food, criando as views necessárias.


## Setup Inicial

Antes de iniciar a aplicação, recomenda-se a execução da seguinte sequência de comandos:

```
rvm use 3.1.2
cd exercicio-semana-11
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

## Login
Dados de acesso : 

email: klaus@gmail.com

password: 123456

## Tecnologias Utilizadas

- Rails
- Dbeaver
- Mysql
- Rubocop

<br>

## Implementações

Na aplicação, as rotas e controllers para cada entidade foram criadas na semana 10 e algumas alteradas para essa parte da atividade.
- Foi feito a criação das views para o Chefs, Prato, Pedidos, Clientes, Categorias com new, index, show, update e destroy. E Items pedidos apenas com new e index. 

- Também foi criado seeds para facilitar os testes de funcionamento das rotas e views.

- A Tela inicial possui uma navbar para melhor usabilidade na criação Chefs,Categorias, etc...

- Foi criado um botão de logout para o usuário poder sair da conta. Para fazer a interação de toggle do menu foi utilizado javascript .

- No controller foi usado callbacks como before_action para certos métodos serem iniciados antes, e o before_action :authenticate_user! para fazer a autenticação de usuário.

- Foi usado Dbeaver para ter uma visualização melhor dos dados do projeto criado nas seeds.


## Desafios

 - Como maior desafio, foi fazer o botao de adicionar item ao pedido, o qual era necessário pegar informações de outras entidades. 

## Autor

Este projeto foi desenvolvido por Klaus Lube, como parte do exercício semanal da Raro Academy(Professor William Franklin de Souza) para aprimorar as habilidades em Views, MVC e rails.