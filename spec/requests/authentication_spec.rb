require 'swagger_helper'

RSpec.describe 'Autenticação', type: :request do
  path '/auth/sign_in' do
    post 'Realizar login' do
      tags 'Autenticação'
      consumes 'application/json'
      parameter name: :credentials, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, example: 'user@example.com' },
          password: { type: :string, example: 'password123' }
        },
        required: %w[email password]
      }

      response '200', 'Login bem-sucedido' do
        schema type: :object,
               properties: {
                 token: { type: :string, example: 'abc123...' }
               }
        run_test!
      end

      response '401', 'Credenciais inválidas' do
        schema type: :object,
               properties: {
                 error: { type: :string, example: 'Credenciais inválidas' }
               }
        run_test!
      end
    end
  end
end