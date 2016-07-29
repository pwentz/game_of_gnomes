class CreateGnomeOrders < ActiveRecord::Migration
  def change
    create_table :gnome_orders do |t|
      t.references :gnome, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
    end
  end
end
