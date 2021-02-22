require 'rails_helper'

RSpec.describe Trade, type: :model do
  describe ' Model.Trade' do
    let(:valid_trade) { create(:trade) }

    context 'validates creation' do
      it 'trade is valid' do
        expect(valid_trade).to be_valid
      end
      it 'trade type is not valid' do
        valid_trade.trade_type = 'seller'
        expect(valid_trade).to_not be_valid
      end
      it 'trade shares are greater then 100' do
        valid_trade.shares = 1000
        expect(valid_trade).to_not be_valid
      end
    end
  end
end
