# Raro Food - Parte 2 

Projeto prático para aulas de Rotas, Controllers, MVC.

O projeto tem como o objetivo continuar o projeto raro-food, criando as rotas e controllers necessários.


## Setup Inicial

Antes de iniciar a aplicação, recomenda-se a execução da seguinte sequência de comandos:

```
rvm use 3.1.2
cd exercicio-semana-10
bundle install
rails db:create
rails db:migrate
rails db:seed
```

<br>

## Tecnologias Utilizadas

- Rails
- Insomnia
- Dbeaver
- Mysql
- Rubocop

<br>

## Implementações

Na aplicação, as rotas e controllers para cada entidade foram criadas sequencialmente. Cada branch e MR é de uma entidade. 
- Para as entidades pedidas, foi decidido criar rotas com as actions do CRUD completo, já para entidades que não foram pedidas no enunciado, foi criado apenas as ações necessárias para a rota pedida.

- Também foi criado seeds para facilitar os testes de funcionamento das rotas e controllers, com ajuda de  requests/response feitas no <b>Insomnia</b>.

- Nos controllers foram criadas condições para encaminhar os parametros de acordo com as rotas e actions corretas.

- Nas rotas, foi usado member para ter rotas aninhadas, e teve uso de resources junto com only, em busca de ter menos linhas no código e pensando na escabilidade da aplicação.

- No controller foi usado callbacks como before_action para certos métodos serem iniciados antes, e o skip_before_action :verify_authenticity_token para skipar a validação de token ao usar o Insomnia no desenvolvimento.

- Foi usado Dbeaver para ter uma visualização melhor dos dados do projeto criado nas seeds.


## Autor

Este projeto foi desenvolvido por Klaus Lube, como parte do exercício semanal da Raro Academy(Professor William Franklin de Souza) para aprimorar as habilidades em Rotas, Controllers, MVC e rails.