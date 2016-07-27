FactoryGirl.define do
  factory :user do
    username "MyString"
    password_digest "MyString"
  end

  factory :gnome do
    name { Faker::GameOfThrones.character }
    price { Faker::Commerce.price }
    desc { Faker::Lorem.sentence }
    image_url { Faker::Placeholdit.image }
    category
  end

  factory :category do
    name { Faker::Commerce.color.capitalize }
  end
end
