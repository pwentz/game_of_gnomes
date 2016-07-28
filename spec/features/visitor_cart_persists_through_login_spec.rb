require 'rails_helper'
#Background: Has items in the cart
#
#As a visitor, when I have items in my cart
#I should not see an option to 'Checkout'
#I should see an option to 'Login or Create Account to Checkout'
#After I create ana ccount
#And I visist '/cart'
#Then I should see all of the datat that was there when I was not logged in
#WHen I click 'Logout'
#Then I should see 'login'
#and I should not see 'logout'

describe 'Visitor cart items can persist into login' do
  scenario 'they see login or create account instead of checkout' do
    user = create(:user)
    gnome_one, gnome_two = create_list(:gnome, 2)
    page.set_rack_session(:user_id => user.id,
                          :bucket => {gnome_one.id => 1,
                                      gnome_two.id => 1})
    visit gnomes_path

    click_link 'Login'
    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_button 'Login'

    visit gnomes_path

    click_link 'View bucket'

    expect(page).to have_link("Login or Create Account to Checkout")
  end
end
