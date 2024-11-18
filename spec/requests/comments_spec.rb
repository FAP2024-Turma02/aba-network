require 'swagger_helper'

RSpec.describe 'comments', type: :request do
  let(:auth_headers) { user.create_new_auth_token } # Gera os tokens de autenticação

  path '/posts/{post_id}/comments' do
    parameter name: 'post_id', in: :path, type: :string, description: 'ID do post associado'

    # GET /posts/:post_id/comments
    get('Lista comentários') do
      tags 'Comments'
      security [bearerAuth: []]
      produces 'application/json'

      response(200, 'successful') do
        let(:post_id) { create(:post).id }

        before do
          auth_headers.each { |key, value| header key, value }
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: { comments: [{ id: 1, content: 'Great post!', user_id: 1 }] }
            }
          }
        end

        run_test!
      end
    end

    # POST /posts/:post_id/comments
    post('create comment') do
      tags 'Comments'
      security [bearerAuth: []]
      consumes 'application/json'
      produces 'application/json'

      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          content: { type: :string, example: 'New comment content' }
        },
        required: ['content']
      }

      response(201, 'created') do
        let(:post_id) { create(:post).id }
        let(:comment) { { content: 'Novo comentário!' } }

        before do
          auth_headers.each { |key, value| header key, value }
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end

  path '/posts/{post_id}/comments/{id}' do
    parameter name: 'post_id', in: :path, type: :string, description: 'ID do post associado'
    parameter name: 'id', in: :path, type: :string, description: 'ID do comentário'

    # GET /posts/:post_id/comments/:id
    get('show comment') do
      tags 'Comments'
      security [bearerAuth: []]
      produces 'application/json'

      response(200, 'successful') do
        let(:post_id) { create(:post).id }
        let(:id) { create(:comment, commentable: create(:post)).id }

        before do
          auth_headers.each { |key, value| header key, value }
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end

    # PATCH /posts/:post_id/comments/:id
    patch('update comment') do
      tags 'Comments'
      security [bearerAuth: []]
      consumes 'application/json'

      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          content: { type: :string, example: 'Updated content' }
        },
        required: ['content']
      }

      response(200, 'successful') do
        let(:post_id) { create(:post).id }
        let(:id) { create(:comment, commentable: create(:post)).id }
        let(:comment) { { content: 'Conteúdo atualizado' } }

        before do
          auth_headers.each { |key, value| header key, value }
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end

    # DELETE /posts/:post_id/comments/:id
    delete('delete comment') do
      tags 'Comments'
      security [bearerAuth: []]
      produces 'application/json'

      response(200, 'successful') do
        let(:post_id) { create(:post).id }
        let(:id) { create(:comment, commentable: create(:post)).id }

        before do
          auth_headers.each { |key, value| header key, value }
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: { message: 'Comment deleted successfully' }
            }
          }
        end

        run_test!
      end
    end
    # Rota para listar e criar respostas (replies) em comentários
    path '/comments/{comment_id}/comments' do
      parameter name: 'comment_id', in: :path, type: :string, description: 'ID do comentário pai'

      get('Lista respostas') do
        tags 'Replies'
        security [bearerAuth: []]
        produces 'application/json'

        response(200, 'successful') do
          let(:comment_id) { create(:comment).id }

          before do
            auth_headers.each { |key, value| header key, value }
          end

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: {
                  comments: [
                    { id: 1, content: 'Great reply!', user_id: 1, created_at: '2024-11-18T12:00:00Z' },
                    { id: 2, content: 'Nice feedback.', user_id: 2, created_at: '2024-11-18T13:00:00Z' }
                  ]
                }
              }
            }
          end

          run_test!
        end
      end

      post('create reply') do
        tags 'Replies'
        security [bearerAuth: []]
        consumes 'application/json'
        produces 'application/json'

        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            content: { type: :string, example: 'This is a reply to a comment' }
          },
          required: ['content']
        }

        response(201, 'created') do
          let(:comment_id) { create(:comment).id }
          let(:comment) { { content: 'Resposta criada com sucesso!' } }

          before do
            auth_headers.each { |key, value| header key, value }
          end

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end

          run_test!
        end
      end
    end

    # Rota para exibir, atualizar e deletar respostas (replies) em comentários
    path '/comments/{comment_id}/comments/{id}' do
      parameter name: 'comment_id', in: :path, type: :string, description: 'comment_id'
      parameter name: 'id', in: :path, type: :string, description: 'id'

      get('show reply') do
        tags 'Replies'
        security [bearerAuth: []]
        produces 'application/json'

        response(200, 'successful') do
          let(:comment_id) { create(:comment).id }
          let(:id) { create(:comment, commentable: create(:comment)).id }

          before do
            auth_headers.each { |key, value| header key, value }
          end

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end

          run_test!
        end
      end

      patch('update reply') do
        tags 'Replies'
        security [bearerAuth: []]
        consumes 'application/json'

        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            content: { type: :string, example: 'Updated reply content' }
          },
          required: ['content']
        }

        response(200, 'successful') do
          let(:comment_id) { create(:comment).id }
          let(:id) { create(:comment, commentable: create(:comment)).id }
          let(:comment) { { content: 'Conteúdo da resposta atualizado' } }

          before do
            auth_headers.each { |key, value| header key, value }
          end

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end

          run_test!
        end
      end

      delete('delete reply') do
        tags 'Replies'
        security [bearerAuth: []]
        produces 'application/json'

        response(200, 'successful') do
          let(:comment_id) { create(:comment).id }
          let(:id) { create(:comment, commentable: create(:comment)).id }

          before do
            auth_headers.each { |key, value| header key, value }
          end

          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end

          run_test!
        end
      end
    end
  end
end
