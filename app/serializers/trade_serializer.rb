class TradeSerializer < ActiveModel::Serializer
  attributes :trade_type, :symbol, :shares, :price, :timestamp

  belongs_to :user
end
