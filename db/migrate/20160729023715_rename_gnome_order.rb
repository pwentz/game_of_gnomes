class RenameGnomeOrder < ActiveRecord::Migration
  def change
    rename_table :gnome_orders, :order_gnomes
  end
end
