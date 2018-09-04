require_relative "../rails_helper.rb"

describe 'Feature Test: User Sign Up', type: :feature do

  it 'navigating from home to the sign up page' do
    visit '/'
    click_link("Sign Up", match: :first)
    expect(current_path).to eq("/users/sign_up")
    expect(page).to have_content("Help Us Map Chicago's Historic Water Tanks")
  end

  it 'does not allow user account creation without an email' do
    visit '/users/sign_up'
    fill_in("user[user_name]", with: "loudmouse")
    fill_in("user[password]", with: "Password1234")
    fill_in("user[password_confirmation]", with: "Password1234")
    click_button("Sign Up")
    expect(page).to have_content("Email can't be blank")
  end

  it 'does not allow user account creation with mismatched password confirmation' do
    visit '/users/sign_up'
    fill_in("user[user_name]", with: "loudmouse")
    fill_in("user[email]", with: "nolan@example.com")
    fill_in("user[password]", with: "Password1234")
    fill_in("user[password_confirmation]", with: "passwordTYPO")
    click_button("Sign Up")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

end
