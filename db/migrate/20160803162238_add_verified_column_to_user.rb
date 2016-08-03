class AddVerifiedColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :verified, :string, default: false
  end
end
