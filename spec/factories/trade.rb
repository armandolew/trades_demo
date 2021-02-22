FactoryBot.define do
  factory :trade do
    user { create(:user) }
    trade_type { 'sell' }
    symbol { 'AT' }
    shares { 100 }
    price { 100 }
    timestamp { Time.now.to_i }
  end
end
