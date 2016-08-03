require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:orders) }
  end

  it 'has a username and password' do
    user = User.new(:username => 'Alan', :password => 'password')

    expect(user.username).to eq('Alan')
    expect(user.password).to eq('password')
  end

  it 'encrypts password' do
    user = User.create(:username => 'Alan', :password => 'password')

    expect(user.username).to eq('Alan')
    expect(user.password_digest).not_to eq('password')
  end

  it { should validate_presence_of(:password) }

  it 'does not create user without password' do
    user = User.create(:username => 'Alan')

    expect(user.id).to eq(nil)
  end

  it { should validate_presence_of(:username) }

  it 'does not create user without username' do
    user = User.create(:password => 'password')

    expect(user.id).to eq(nil)
  end

  it 'does not create 2 users with the same name' do
    user = User.create(:username => 'Alan', :password => 'password')
    user_two = User.create(:username => 'Alan', :password => 'password')

    expect(user_two.id).to eq(nil)
  end

  it 'a new should have a role of default' do
    user = User.new(:username => 'Alan', :password => 'password')

    expect(user.role).to eq('default')
  end

  it 'an admin should have a role of admin' do
    user = User.new(:username => 'Alan', :password => 'password', role: 1)

    expect(user.role).to eq('admin')
  end
end
