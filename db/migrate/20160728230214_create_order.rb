class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total_price
      t.references :user, index: true, foreign_key: true
    end
  end
end
