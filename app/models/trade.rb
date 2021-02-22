class Trade < ApplicationRecord
  belongs_to :user

  validates :trade_type, {
    presence: true,
    inclusion: { in: ['buy', 'sell'] }
  }

  validates :shares, {
    inclusion: { in: 1..100 }
  }
end
