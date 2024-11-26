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

- **Rubocop (~> 1.50)**: 
  - Ferramenta de análise estática de código Ruby. Ela ajuda a identificar e corrigir problemas no estilo de código, garantindo que ele esteja alinhado com as melhores práticas. 

  #### Melhoria da eficiência com Rubocop:

  Para melhor eficiência ao usar o **Rubocop**, recomendamos o uso do editor **VSCode** com as seguintes configurações:
  - Instale as extensões:
    - [Ruby LSP](https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp): Adiciona suporte ao Ruby Language Server Protocol, com recursos como autocomplete e diagnósticos.
    - [Rubocop](https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop): Fornece linting e autocorreções integradas no editor.
  - Configure o `settings.json` do VSCode com:
    ```json
    {
      "rubyLsp.enabled": true,
      "ruby.rubocop.onSave": true,
      "editor.formatOnSave": true
    }
    ```
  Essas configurações garantem que o código seja automaticamente analisado e corrigido ao salvar um arquivo.

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
