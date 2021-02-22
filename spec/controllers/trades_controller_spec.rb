require 'rails_helper'

RSpec.describe TradesController, type: :controller do
  let(:trades){ create_list(:trade, 10) }
  let(:user) { create(:user) }
  let(:trade) { create(:trade) }

  describe 'GET #index' do
    it 'returns trades' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a trade' do
      post :create, params: { trade: { user_id: user.id, trade_type: 'sell', symbol:  'AT', shares: 100, price: 100, timestamp: Time.now.to_i } }

      expect(response).to have_http_status(201)
    end

    it 'fails to create a test' do
      post :create, params: { trade: { user_id: user.id, trade_type: 'seller', symbol:  'AT', shares: 100, price: 100, timestamp: Time.now.to_i } }

      expect(response).to have_http_status(400)
    end
  end

  describe 'GET #show' do
    it 'returns a trade' do
      get :show, params: { id: trade.id }
    end
  end

  describe 'PUT #update' do
    it 'returns 405 response' do
      patch :update, params: { id: trade.id, trade: { user_id: user.id, trade_type: 'sell', symbol:  'AT', shares: 100, price: 100, timestamp: Time.now.to_i } }
      expect(response).to have_http_status(405)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns 405 response' do
      delete :destroy, params: { id: trade.id, trade: { user_id: user.id, trade_type: 'sell', symbol:  'AT', shares: 100, price: 100, timestamp: Time.now.to_i } }
      expect(response).to have_http_status(405)
    end
  end
end
