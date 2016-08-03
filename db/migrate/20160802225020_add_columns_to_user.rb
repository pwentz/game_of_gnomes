class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :country_code, :string
    add_column :users, :phone_number, :string
  end
end
