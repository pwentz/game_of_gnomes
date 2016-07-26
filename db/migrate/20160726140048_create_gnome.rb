class CreateGnome < ActiveRecord::Migration
  def change
    create_table :gnomes do |t|
      t.string :name
      t.decimal :price
      t.text :desc
    end
  end
end
