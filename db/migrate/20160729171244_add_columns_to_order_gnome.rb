class AddColumnsToOrderGnome < ActiveRecord::Migration
  def change
    add_column :order_gnomes, :quantity, :integer
    add_column :order_gnomes, :subtotal, :decimal
  end
end
