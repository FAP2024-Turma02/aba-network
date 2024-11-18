# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under openapi_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a openapi_spec tag to the
  # the root example_group in your specs, e.g. describe '...', openapi_spec: 'v2/swagger.json'
  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'ABA - Network - SOFTEX- v1',
        description: "Esta aplicação é um hub colaborativo para facilitar o compartilhamento de projetos
        relacionados à cultura maker entre professores, educadores e estudantes de instituições de ensino,
        ONGs e associações. Destina-se à exposição de projetos educacionais e criativos, promovendo a colaboração
        e a troca de ideias em um ambiente seguro e moderado.",
        version: 'v1',
        contact: {
          name: 'Repositorio da API',
          url: 'https://github.com/FAP2024-Turma02/aba-network'
        }
      },
      paths: {},
      servers: [
        {
          url: 'http://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'localhost:3000'
            }
          }
        }
      ],
      components: {
        securitySchemes: {
          bearerAuth: { # Esquema de autenticação com Bearer Token
            type: :http,
            scheme: :bearer,
            bearerFormat: :Token
          }
        },
        schemas: {
          ActiveStorageAttachment: {
            type: 'object',
            properties: {
              name: { type: 'string', example: 'image.png' },
              record_type: { type: 'string', example: 'Post' },
              record_id: { type: 'integer', example: 1 },
              blob_id: { type: 'integer', example: 123 },
              created_at: { type: 'string', format: 'date-time', example: '2024-11-01T12:00:00Z' }
            }
          },
          ActiveStorageBlob: {
            type: 'object',
            properties: {
              key: { type: 'string', example: 'abcdef123456' },
              filename: { type: 'string', example: 'image.png' },
              content_type: { type: 'string', example: 'image/png' },
              metadata: { type: 'string', example: '{}' },
              service_name: { type: 'string', example: 'local' },
              byte_size: { type: 'integer', example: 204800 },
              checksum: { type: 'string', example: 'sha256-abc123' },
              created_at: { type: 'string', format: 'date-time', example: '2024-11-01T12:00:00Z' }
            }
          },
          Comment: {
            type: 'object',
            properties: {
              content: { type: 'string', example: 'Great post!' },
              user_id: { type: 'integer', example: 1 },
              commentable_id: { type: 'integer', example: 1 },
              commentable_type: { type: 'string', example: 'Post' },
              created_at: { type: 'string', format: 'date-time', example: '2024-11-01T12:00:00Z' },
              updated_at: { type: 'string', format: 'date-time', example: '2024-11-01T12:00:00Z' }
            }
          },
          Company: {
            type: 'object',
            properties: {
              name: { type: 'string', example: 'Acme Corporation' },
              cnpj: { type: 'string', example: '12.345.678/0001-90' },
              created_at: { type: 'string', format: 'date-time', example: '2024-11-01T12:00:00Z' },
              updated_at: { type: 'string', format: 'date-time', example: '2024-11-01T12:00:00Z' }
            }
          },
          User: {
            type: 'object',
            properties: {
              email: { type: 'string', example: 'user@example.com' },
              encrypted_password: { type: 'string', example: '$2a$12$KIXv3I1H1y5A5Kg3kGZrMOgQ5E..' },
              name: { type: 'string', example: 'John Doe' },
              role: { type: 'integer', example: 0 },
              admin: { type: 'boolean', example: false },
              provider: { type: 'string', example: 'email' },
              uid: { type: 'string', example: 'user@example.com' },
              tokens: { type: 'object', example: {} },
              company_id: { type: 'integer', example: 1 },
              created_at: { type: 'string', format: 'date-time', example: '2024-11-01T12:00:00Z' },
              updated_at: { type: 'string', format: 'date-time', example: '2024-11-01T12:00:00Z' }
            }
          },
          Post: {
            type: 'object',
            properties: {
              content: { type: 'string', example: 'This is a sample post content.' },
              published: { type: 'boolean', example: true },
              created_at: { type: 'string', format: 'date-time', example: '2024-11-01T12:00:00Z' },
              updated_at: { type: 'string', format: 'date-time', example: '2024-11-01T12:00:00Z' }
            }
          },
          Domain: {
            type: 'object',
            properties: {
              domain_url: { type: 'string', example: 'https://example.com' },
              created_at: { type: 'string', format: 'date-time', example: '2024-11-01T12:00:00Z' },
              updated_at: { type: 'string', format: 'date-time', example: '2024-11-01T12:00:00Z' }
            }
          }
        },
         security: [
        { bearerAuth: [] } # Aplicação global do esquema de segurança
      ]
      }
    }
  }
  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The openapi_specs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.openapi_format = :yaml
end
