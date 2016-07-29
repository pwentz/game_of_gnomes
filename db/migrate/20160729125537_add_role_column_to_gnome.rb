class AddRoleColumnToGnome < ActiveRecord::Migration
  def change
    add_column :gnomes, :role, :integer
  end
end
