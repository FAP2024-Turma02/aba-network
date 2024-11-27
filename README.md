# Aba Network

Este é um projeto colaborativo desenvolvido para facilitar o compartilhamento e troca de projetos relacionados à cultura maker entre professores, educadores e estudantes. A aplicação é voltada para instituições educacionais e espaços de educação não formal, promovendo um ambiente seguro e moderado para a exposição e troca de ideias criativas.

---

## Tecnologias Utilizadas

- **Ruby on Rails** `~> 7.0.8`, `>= 7.0.8.4`
- **PostgreSQL** `~> 1.1`
- **Puma** `~> 5.0`

---

## Pré-requisitos

Certifique-se de que sua máquina atenda aos seguintes requisitos:

- **Ruby** (versão 3.2.2 ou superior)
- **Rails** (versão 7.0.8.4)
- **PostgreSQL** (versão 12 ou superior)
- **Bundler** (versão 2.4 ou superior)

---

## Configuração e Instalação

### 1. Clone o repositório
```bash
git clone https://github.com/FAP2024-Turma02/aba-network.git
cd aba-network
```
---
### 2. Instale as dependências
```bash
bundle install
```
---
### 3. Configure o banco de dados
Edite o arquivo config/database.yml com as configurações do seu banco de dados PostgreSQL.
Depois, execute os comandos abaixo para criar e migrar o banco:
```bash
rails db:create
rails db:migrate
```
---
### 4. Inicie o servidor
```bash
rails server
```
---
### 5. Acesse a aplicação
Abra o navegador e vá para http://localhost:3000.
