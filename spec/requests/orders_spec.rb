# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'POST /orders' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          order: {
            description: 'Fake teste orders 1'
          }
        }
      end

      it 'creates a new Orders' do
        expect { post '/orders', params: valid_params }.to change(Order, :count).by(+1)
        expect(response).to have_http_status(302)
      end

      it 'creates a Order with the correct attributes' do
        post '/orders', params: valid_params
        expect(Order.last).to have_attributes valid_params[:order]
      end
    end
  end

  describe 'PUT /order/:id' do
    activity_params = { order: {
      description: 'Basketball 3v3',
      control_number: SecureRandom.alphanumeric,
      status: 'pedding'
    } }

    order = Order.new(activity_params[:order])
    order.save
    context '# check success update for in_progres' do
      it 'returns status code 302' do
      put order_path(order.id), params: { order: { status: 'in_progres' } }
        expect(response).to have_http_status(302)
      end
    end

    context '# check success update for concluead' do
      it 'returns status code 302' do
      put order_path(order.id), params: { order: { status: 'concluead' } }
        expect(response).to have_http_status(302)
      end
    end
  end
end
