class AddImageColunmToGnome < ActiveRecord::Migration
  def change
    add_column :gnomes, :image_url, :string
  end
end
