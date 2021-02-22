class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.references :user
      t.string :trade_type, null: false
      t.string :symbol
      t.integer :shares, null: false
      t.integer :price
      t.integer :timestamp

      t.timestamps
    end
  end
end
