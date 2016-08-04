require 'rails_helper'

describe OrderGnomeSynthesizer, type: :model do
  before(:each) do
    @user = create(:user)
    gnome = create(:gnome)
    @bucket = {gnome.id => 1}
    order = create(:order, :user => @user)
    allow_any_instance_of(
      ApplicationController
    ).to receive(:current_user).and_return(@user)
  end

  it 'can generate order_gnomes' do
    synthesizer = OrderGnomeSynthesizer
    mock_session = {'user_id' => @user.id, 'bucket' => @bucket}
    user_gnome_orders = @user.orders.last.order_gnomes

    expect{
      synthesizer.generate_order_gnomes(mock_session)
    }.to change{ user_gnome_orders.count }.from(0).to(1)
  end
end
