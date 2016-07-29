FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password "MyString"
  end

  factory :gnome do
    name { Faker::Name.first_name }
    price { Faker::Commerce.price }
    desc { Faker::Lorem.sentence }
    image_url { Faker::Placeholdit.image }
    category
    role 0
  end

  factory :category do
    name { Faker::Lorem.word }
  end

  factory :order do
    user
    status 0
  end
end
