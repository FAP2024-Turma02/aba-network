# README

## Dependências do Projeto

Este projeto utiliza várias gems para fornecer diferentes funcionalidades. Abaixo está uma explicação detalhada das principais gems incluídas no arquivo `Gemfile`:

### Ruby Version

- **Ruby 3.2.1**: O projeto está configurado para rodar na versão `3.2.1` do Ruby. Certifique-se de que esta versão está instalada no seu ambiente.

### Gems Utilizadas

- **Rails (~> 7.0.8, >= 7.0.8.4)**: 
  - Framework web completo que fornece uma arquitetura MVC (Model-View-Controller), bem como uma variedade de ferramentas para construir APIs, sistemas web e aplicações modernas.

- **pg (~> 1.1)**: 
  - Adaptação do PostgreSQL para ActiveRecord. Esta gem permite que o Rails se comunique com o banco de dados PostgreSQL.

- **Puma (~> 5.0)**: 
  - Servidor de aplicação usado por padrão no Rails. Ele é projetado para ser concorrente, rápido e adequado para ambientes de produção.

- **tzinfo-data**: 
  - Inclui dados de fuso horário para ambientes Windows, que não fornecem esses dados nativamente. Necessário apenas ao rodar o projeto em sistemas Windows.

- **Bootsnap**: 
  - Acelera o tempo de inicialização da aplicação através de caching. É especialmente útil em projetos grandes para reduzir a latência ao iniciar o Rails.

### Gems para Desenvolvimento e Teste

Estas gems são carregadas apenas no ambiente de desenvolvimento e teste:

- **Debug**: 
  - Ferramenta de depuração que permite adicionar breakpoints e inspecionar o código durante o desenvolvimento e teste da aplicação. Compatível com várias plataformas Ruby.

### Gems para Autenticação

- **Devise (~> 4.9)**: 
  - Sistema completo de autenticação para Rails. O Devise fornece soluções rápidas e seguras para implementar login, logout, recuperação de senha e outras funcionalidades relacionadas à autenticação de usuários.

### Agrupamento de Gems

- **group :development, :test**: 
  - Gems dentro desse grupo serão instaladas apenas nos ambientes de desenvolvimento e teste.

- **group :development**: 
  - Gems deste grupo serão instaladas exclusivamente no ambiente de desenvolvimento.

### Instruções para Variáveis de Ambiente

Recomendamos o uso de variáveis de ambiente para armazenar informações sensíveis como o `username`, `password`, `host` e `port` do banco de dados. Veja mais no arquivo `config/database.yml`.

### Executando a Aplicação

Após instalar as dependências com `bundle install`, você pode iniciar o servidor utilizando:

```bash
rails server
```

# Sign in

Requisitos para logar. (A criação de uma conta só pode ser feita por meio de um administrador.)

- **email**
- **password**

Após o sign in ele irá gerar um token de acesso no Headers.
```
Authorization | Bearer {token que é gerado}
```

# User

Este controlador lida com operações CRUD para o recurso `User`, implementando verificações de autorização usando o Pundit.

## Ações (OBS: É necessário o token de acesso para poder utilizar o CRUD)

- **Index**: Retorna uma lista de usuários, ordenada por `created_at`, serializada usando `UserSerializer` (http://127.0.0.1:3000/users).

```json
[
    {
        "name": "Teste",
        "email": "teste@softex.com",
        "role": "user",
        "admin": false,
        "created_at": "21/11/2024 23:51",
        "updated_at": "21/11/2024 23:51"
    }, ...
]
```
  
- **show**: Busca e retorna um usuário específico por ID, serializado usando `UserSerializer` (http://127.0.0.1:3000/users/:id).
  
```json
{
    "name": "Cleytinho",
    "email": "cleyton@softex.com",
    "role": "user",
    "admin": false,
    "created_at": "16/11/2024 18:46",
    "updated_at": "16/11/2024 18:46"
}
```
  
- **create**: Cria um novo usuário a partir de parâmetros permitidos e retorna o usuário serializado.
### 1° - No body irá colocar o json do usuário:
```json
{
  "user": {
    "name": "Teste2",
    "email": "teste2@softex.com",
    "password": "Password123@",
    "role": "user",
    "admin": false,
    "company_id": 40
  }
}
```

### 2° - Após a requisição será retornado o status de 200 e o json do usuário criado:

```json
{
    "name": "Teste2",
    "email": "teste2@softex.com",
    "role": "user",
    "admin": false,
    "created_at": "23/11/2024 18:09",
    "updated_at": "23/11/2024 18:09"
}
```

- **update**: Atualiza as informações de um usuário existente e retorna o usuário serializado (http://127.0.0.1:3000/users/67).
### 1° - Para alterar é necessário colocar o campo que deseja alterar e em seguida deve colocar o que vai ser enviado.
```json
{
    "user": {
        "role": "admin"
    }
}
```
### 2° - Após a alteração retornará um json com status 200 junto com os dados atualizados.
  ```json
{
    "name": "Rafael",
    "email": "rafael@softex.com",
    "role": "admin",
    "admin": true,
    "created_at": "25/10/2024 01:08",
    "updated_at": "23/11/2024 19:44"
}
  ```

- **destroy**: Exclui um usuário e não retorna nenhum conteúdo.

### 1° - Ao colocar na rota da requisição o ID ele irá deletar o user. Assim exibindo o status 204.
```json
204 No Content
```



## Autorização

O controlador usa o Pundit para garantir que os usuários tenham permissões apropriadas para executar ações. O método `authorize` garante que o usuário atual esteja autorizado para a ação solicitada.



